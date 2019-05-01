package com.spring.controller;

import java.io.File;
import java.sql.Connection;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.spring.domain.AccommodationVO;
import com.spring.domain.AirUserVO;
import com.spring.domain.Criteria;
import com.spring.domain.KakaoUserVO;
import com.spring.domain.jjimVO;
import com.spring.service.AccommodationService;
import com.spring.service.AirUserService;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/AirVienna/*")
@Slf4j
@SessionAttributes({"info","jjimlist"})
public class AirUserController {
	
	@Inject
	private AirUserService service;
	@Inject
	private AccommodationService homeservice;
	
	@GetMapping("/joinpage")
	public void join() {
		log.info("회원가입 page....");
	};
	
	@PostMapping("/joinpage")
	public String joinpost(AirUserVO vo,RedirectAttributes rttr) {
		log.info("회원가입 성공"+vo.toString());
		if(vo.getAttachList()!=null) {
			for(AirUserVO attach:vo.getAttachList()) {
				log.info(""+attach);
			}
		}
		if(service.insert(vo)) {
				return "redirect:mainpage";
			}
		rttr.addFlashAttribute("result",vo.getBno());
		return "redirect:mainpage";
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("login 요청");
	};

	@PostMapping("/login")
	public String loginPost(AirUserVO vo,Model model)  {
		log.info("로그인..."+vo.toString());
		AirUserVO info = service.login(vo);
		if(info == null) {
			log.info("틀렸음");
			return "redirect:mainpage";
		}else {
			//log.info("로그인정보..."+vo.toString());
			model.addAttribute("info",info);
			log.info("정보 : "+info.getEmail()+info.getUploadPath());
			return "redirect:mainpage";
		}
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("로그아웃...");
		status.setComplete();
		//session.removeAttribute("info");
		return "redirect:mainpage";
	}
	
	@PostMapping("/kakaoLogin")	
	public ResponseEntity<String> kakaoLogin(@RequestBody KakaoUserVO vo, Model model) {
		log.info("kakao..."+vo.toString());
		if(vo!=null) {
			model.addAttribute("info",vo);			
		}
		log.info("session..."+vo.toString());
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	

	@PostMapping(value="/googleLogin",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> googleLogin(@RequestBody KakaoUserVO vo, Model model) {
		log.info("google..."+vo.toString());
		if(vo!=null) {
			model.addAttribute("info",vo);			
		}
		log.info("session..."+vo.toString());
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	
/*	@PostMapping(value="/googleLogin", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String googleLogin(@RequestBody KakaoUserVO vo, Model model) {
		log.info("google..."+vo.toString());
		model.addAttribute("info",vo);
		log.info("session..."+vo.toString());
		return "redirect:mainpage";
	}
*/
	@ResponseBody
	@PostMapping("/checkEmail")
	public String checkEmail(String email) {
		log.info("중복 이메일..."+email);
		AirUserVO dupEmail = service.selectByEmail(email);
		//dupEmail이 널이 아니면 사용중인 아이디
		if(dupEmail!=null) {
			log.info("이미 사용중인 아이디 입니다.");
			return "false";
		}else {
			//널이면 사용할 수 있는 아이디
			log.info("사용가능한 아이디 입니다.");
			return "true";
		}
	}
	@GetMapping("/mainpage")
	public void mainpage() {
		log.info("메인페이지 호출...");
	}
	@PostMapping("/search")
	public String accommodationlist(Criteria ct, Model model) {
		log.info("등록하기"+ct.getRegion());
		log.info("등록하기"+ct.getCheckin());
		log.info("등록하기"+ct.getCheckout());
		log.info("등록하기"+ct.getMaxperson());
		
		if(ct.getRegion().isEmpty()&&ct.getMaxperson().isEmpty()&&ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()) {
			ct.setType("E");
			List<AccommodationVO> list=homeservice.optionE(ct);
			model.addAttribute("ct",ct);
			model.addAttribute("list",list);
		}
		if(!ct.getRegion().isEmpty()) {
			if(ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()&&ct.getMaxperson().isEmpty()) {
				ct.setType("R");
				List<AccommodationVO> list=homeservice.optionR(ct);
				model.addAttribute("ct",ct);
				model.addAttribute("list",list);
			}
		}
		if(!ct.getMaxperson().isEmpty()) {
			if(ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()&&ct.getRegion().isEmpty()) {
				ct.setType("M");
				List<AccommodationVO> list=homeservice.optionM(ct);
				model.addAttribute("ct",ct);
				model.addAttribute("list",list);
			}
		}
		if(!ct.getCheckin().isEmpty()&&!ct.getCheckin().isEmpty()) {
			if(ct.getRegion().isEmpty()&&ct.getMaxperson().isEmpty()) {
				ct.setType("T");
				List<AccommodationVO> list=homeservice.optionT(ct);
				model.addAttribute("ct",ct);
				model.addAttribute("list",list);
			}
		}
		if(!ct.getCheckin().isEmpty()&&!ct.getCheckin().isEmpty()&&!ct.getRegion().isEmpty()) {
			if(ct.getMaxperson().isEmpty()) {
				ct.setType("RT");
				List<AccommodationVO> list=homeservice.optionRT(ct);
				model.addAttribute("ct",ct);
				model.addAttribute("list",list);
			}
		}
		if(!ct.getCheckin().isEmpty()&&!ct.getCheckin().isEmpty()&&!ct.getMaxperson().isEmpty()) {
			if(ct.getRegion().isEmpty()) {
				ct.setType("TM");
				List<AccommodationVO> list=homeservice.optionTM(ct);
				model.addAttribute("ct",ct);
				model.addAttribute("list",list);
			}
		}
		if(!ct.getRegion().isEmpty()&&!ct.getMaxperson().isEmpty()) {
			if(ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()) {
				ct.setType("RM");
				List<AccommodationVO> list=homeservice.optionRM(ct);
				model.addAttribute("ct",ct);
				model.addAttribute("list",list);
			}
		}
		if(!ct.getRegion().isEmpty()&&!ct.getMaxperson().isEmpty()&&!ct.getCheckin().isEmpty()&&!ct.getCheckout().isEmpty()) {
			ct.setType("RTM");
			List<AccommodationVO> list=homeservice.optionRTM(ct);
			model.addAttribute("ct",ct);
			model.addAttribute("list",list);
		}
		
		log.info("type "+ct.getType());
		
		return "AirVienna/accommodationlist";
	}
	@GetMapping("/search")
	public String accommodationlist1(Criteria ct, Model model) {
		log.info("등록하기"+ct.getRegion());
		log.info("등록하기"+ct.getCheckin());
		log.info("등록하기"+ct.getCheckout());
		log.info("등록하기"+ct.getMaxperson());
		
			List<AccommodationVO> list=homeservice.optionE(ct);
			model.addAttribute("ct",ct);
			model.addAttribute("list",list);
		
		
		return "AirVienna/accommodationlist";
	}
	@PostMapping("/headsearch")
	public String accommodationlisthead(String region, Model model) {
		List<AccommodationVO> list=homeservice.optionR(region);
		model.addAttribute("region",region);
		model.addAttribute("list",list);
		
		return "AirVienna/accommodationlist";
	}
	@GetMapping("/accommodationlist")
	public void listpage(Criteria ct, Model model){
		log.info("리스트페이지 호출...");
		ct.setType("E");
		List<AccommodationVO> list=homeservice.optionE(ct);
		model.addAttribute("list",list);
	}
	@PostMapping("/jjimregist")
	public String jjimregost(jjimVO vo,Model model,RedirectAttributes rttr) {
		log.info("bno확인"+vo.getBno());
		log.info("ano확인"+vo.getAno());
		log.info("homename확인"+vo.getHomename());
		log.info("select 확인"+vo.isJjimselect());
		log.info("price 확인"+vo.getPrice());
		int result = homeservice.jjiminsert(vo);
		
		if(result>0) {
			rttr.addFlashAttribute("insert","success");
		}else {
			rttr.addFlashAttribute("insert","fail");
		}	
		List<jjimVO> list=homeservice.jjimlist(vo.getBno());
		model.addAttribute("jjimlist",list);
		return "redirect:accommodationlist";
	}
	@GetMapping("/jjimlist")
	public String jjimlist(@ModelAttribute("info")AirUserVO info,Model model) {
		int bno=info.getBno();
		List<jjimVO> list=homeservice.jjimlist(bno);
		model.addAttribute("jjimlist",list);
		
		return "AirVienna/jjimpage";
	}
	@GetMapping("/jjimpage")
	public void jjimpage() {
		
	}
	@PostMapping("/jjimremove")
	public String jjimremove(int ano,RedirectAttributes rttr) {
		log.info("ano 확인"+ano);
		int result = homeservice.jjimremove(ano);
		if(result>0) {
			rttr.addFlashAttribute("insert","success");
		}else {
			rttr.addFlashAttribute("insert","fail");
		}
		return "redirect:jjimlist";
	}
	@PostMapping("/jjimremovelist")
	public String jjimremovelist(int ano,RedirectAttributes rttr) {
		log.info("ano 확인"+ano);
		int result = homeservice.jjimremove(ano);
		if(result>0) {
			rttr.addFlashAttribute("insert","success");
		}else {
			rttr.addFlashAttribute("insert","fail");
		}
		return "redirect:accommodationlist";
	}
}