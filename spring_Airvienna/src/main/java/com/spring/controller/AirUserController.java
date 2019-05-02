package com.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.spring.domain.AccommodationVO;
import com.spring.domain.AirUserVO;
import com.spring.domain.Criteria;
import com.spring.domain.HomeAttachVO;
import com.spring.domain.SnsUserVO;
import com.spring.domain.jjimVO;
import com.spring.service.AccommodationService;
import com.spring.service.AirUserService;
import com.spring.service.HomeRegisterService;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/AirVienna/*")
@Slf4j
@SessionAttributes({"info","jjimlist","sns","profile"})
public class AirUserController {
	
	@Inject
	private AirUserService service;
	@Inject
	private AccommodationService homeservice;
	@Inject 
	private HomeRegisterService homeattservice;
	
	@GetMapping("/profile")
	public void profilePage(@ModelAttribute("info")AirUserVO vo,Model model){
		log.info("프로필페이지 호출...");

	}	
	
	/*
	 * @GetMapping("/joinpage") public void join() { log.info("회원가입 page...."); };
	 */
	
	@GetMapping("/step1")
	public void step1() {
		log.info("step1 페이지 호출");
	}
	@PostMapping("/step2")
	public String step2(@RequestParam(value="agree",defaultValue="false")boolean agree,
			RedirectAttributes rttr) {
		log.info("회원 가입 폼 요청.....");
		//약관동의 여부 체크하기
		//약관동의를 안했다면 step1 페이지로 돌려보내고
		//동의를 했다면 step2 페이지가 보여지도록 코드 작성
		if(!agree) {
			rttr.addFlashAttribute("check", false);
			return "redirect:step1";
		}
		return "/AirVienna/joinpage";		
	}
	/*
	 * @GetMapping("/joinpage") public void join() { log.info("회원가입 page...."); };
	 */
	
	@PostMapping("/step3")
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
		log.info("로그인요청...");
		AirUserVO info = service.login(vo);
		if(info == null) {
			log.info("틀렸음");
			return "redirect:mainpage";
		}else {
			//log.info("로그인정보..."+vo.toString());
			log.info("정보 : "+info.toString());
			model.addAttribute("info",info);
			int bno=info.getBno();
			List<jjimVO> jjimlist=homeservice.jjimlist(bno);
			model.addAttribute("jjimlist",jjimlist);
			return "redirect:mainpage";
		}
	}
	
	@PostMapping("/kakaoLogin")	
	public ResponseEntity<String> kakaoLogin(@RequestBody SnsUserVO vo, Model model) {
		log.info("kakao..."+vo.toString());
		if(vo!=null) {
			model.addAttribute("sns",vo);			
		}
		log.info("session..."+vo.toString());
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	

	@PostMapping(value="/googleLogin",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> googleLogin(@RequestBody SnsUserVO vo, Model model) {
		log.info("google..."+vo.toString());
		if(vo!=null) {
			model.addAttribute("sns",vo);			
		}
		log.info("session..."+vo.toString());
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("로그아웃...");
		status.setComplete();
		//session.removeAttribute("info");
		return "redirect:mainpage";
	}
	
	@GetMapping(value= {"/step2","/step3"})
	public String handleStep2_3Get() {
		return "redirect:step1";
	}
	
	@PostMapping("/home_register")
	public String homeRegister(@ModelAttribute("info")AirUserVO info,AccommodationVO vo) {
		log.info("집정보 등록...");
		log.info(vo+"aa");
		vo.setBno(info.getBno());
		if(vo.getHomeAttach() != null) {
			for (HomeAttachVO attach : vo.getHomeAttach()) {
				log.info("" + attach);
			}
		}
		homeattservice.homeRegister(vo);
		return "redirect:accommodationlist";
		
	}
	
	@GetMapping("/home_register")
	public String home_register(AirUserVO info, Model model) {
		log.info("집등록페이지 호출...");
		
		
		return "AirVienna/home_register";
	}

	
	
	
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
	public void listpage(Criteria ct, Model model)

{
		log.info("리스트페이지 호출...");
		ct.setType("E");
		List<AccommodationVO> list = homeservice.optionE(ct);
		
		//list의 ano추출
		for(AccommodationVO vo:list) {
			int ano=vo.getAno();
			HomeAttachVO vo2 = homeattservice.homeAttachList(ano);
			vo.setHomeAttach(new ArrayList<>());
			
			vo.getHomeAttach().add(vo2);
			log.info(vo+"");
		}
		log.info(list+"");
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