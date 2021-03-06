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
import com.spring.domain.ChangePwd;
import com.spring.domain.Criteria;
import com.spring.domain.HomeAttachVO;
import com.spring.domain.ReserveVO;
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
@SessionAttributes({"info","jjimlist","sns","ct"})
public class AirUserController {
	 
	@Inject
	private AirUserService service;
	@Inject
	private AccommodationService homeservice;
	@Inject 
	private HomeRegisterService homeattservice;
 
	
	
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
	public String loginPost(AirUserVO vo,Model model,RedirectAttributes rttr)  {
		log.info("로그인...");
		AirUserVO info = service.login(vo);
		if(info == null) {
			log.info("틀렸음");
			rttr.addFlashAttribute("fa","false");
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
	
	@GetMapping("/userdelete")
	public String userdelete(@ModelAttribute("info") AirUserVO info,SessionStatus status,RedirectAttributes rttr) {
		int result = service.userdelete(info.getEmail());
		if(result > 0) {
			status.setComplete();
			rttr.addFlashAttribute("msg","success");
		}
		return "redirect:mainpage";
		
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("로그아웃...");
		status.setComplete();
		//session.removeAttribute("info");
		return "redirect:mainpage";
	}
	
	@GetMapping(value= {"/step2,/step3"})
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

	@GetMapping("/home_modify")
	public String home_modify(@ModelAttribute("info")AirUserVO info ,AccommodationVO vo, Model model) {
		log.info("집관리 페이지 호출...");
		
		vo.setBno(info.getBno());
		
		vo = homeservice.get_home(vo);
		List<HomeAttachVO> vo2 = homeattservice.findByAno(vo.getAno());
		vo.setHomeAttach(vo2);
		
		log.info(vo.getPrice()+"");	
		log.info(vo.getAno()+"");
		log.info(vo.getBno()+"");
		log.info(vo.getHomeAttach()+"");
		model.addAttribute("vo",vo);
		
		return "AirVienna/home_modify";
	}
	
	@PostMapping("/user_modify")
	public String profile_modify(@ModelAttribute("info")AirUserVO info, AirUserVO vo) {
		log.info("유저 정보 수정...");
		log.info(info.getFileName());
		log.info(info.getTel());
		log.info(info.getBno()+"");
		log.info(info.getUploadPath());
		
		vo.setBno(info.getBno());
		
		boolean result = service.profile_modify(vo);
		
		if(result) {
			log.info("성공");
			return "AirVienna/profile";
		}
		log.info("실패");
		
		return "AirVienna/profile";
		
		
		
	}
	
	@GetMapping("/password_change")
	public void passwordPage(){
		log.info("패스워드폼 호출...");
	}	
	@PostMapping("/password_change")
	public String passwordPost(@ModelAttribute("info") AirUserVO info,  ChangePwd pwd,SessionStatus status,RedirectAttributes rttr) {
		pwd.setEmail(info.getEmail());
		int result = service.changePwd(pwd);
		log.info("pwd"+pwd.getPassword());
		if(result > 0) {
			status.setComplete();
			log.info("변경완료");
			rttr.addFlashAttribute("success","success");
			return "redirect:mainpage";
		}else {
			rttr.addFlashAttribute("fail","false");
			return "redirect:password_change";
		}
	}
	
	
	@GetMapping("/profile")
	public String profile(@ModelAttribute("info")AirUserVO info,AccommodationVO vo, Model model) {
		log.info("프로필 호출");
		
		vo.setBno(info.getBno());
		
		vo = homeservice.get_home(vo);
		
		HomeAttachVO Attvo = homeattservice.homeAttachList(vo.getAno()); // 세션에있는 bno에 해당하는 어태치목록 가져오고 attvo에 담음
		vo.setHomeAttach(new ArrayList<>());
		
		vo.getHomeAttach().add(Attvo);
		
		log.info(Attvo+"");
		log.info(vo+"");
		model.addAttribute("vo",vo);
		
		return "AirVienna/profile";
			
	}
	
	@GetMapping("/mypage")
	public String mypage(@ModelAttribute("info")AirUserVO vo) {
		log.info("mypage");
		log.info(vo.getBirth());
		return "AirVienna/Mypage";
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
		log.info("등록하기"+ct.getRegion2());
		log.info("등록하기"+ct.getCheckin());
		log.info("등록하기"+ct.getCheckout());
		log.info("등록하기"+ct.getMaxperson());
		
		
		
		if(ct.getRegion2().isEmpty()&&ct.getMaxperson().isEmpty()&&ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()) {
			ct.setType("E"); // 전부 비어있는 채로 검색
			model.addAttribute("ct",ct);
		}
		if(!ct.getRegion2().isEmpty()) {
			if(ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()&&ct.getMaxperson().isEmpty()) {
				ct.setType("R"); // 지역만 입력하고 검색
				model.addAttribute("ct",ct);
			}
		}
		if(!ct.getMaxperson().isEmpty()) {
			if(ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()&&ct.getRegion2().isEmpty()) {
				ct.setType("M");  // 숙박 인원 입력하고 최대 허옹인원 과 비교해서 검색
				model.addAttribute("ct",ct);
			}
		}
		if(!ct.getCheckin().isEmpty()&&!ct.getCheckin().isEmpty()) {
			if(ct.getRegion2().isEmpty()&&ct.getMaxperson().isEmpty()) {
				ct.setType("T"); // 체크인 체크아웃 기간에 예약 가능 한 방 검색
				model.addAttribute("ct",ct);
			}
		}
		if(!ct.getCheckin().isEmpty()&&!ct.getCheckin().isEmpty()&&!ct.getRegion2().isEmpty()) {
			if(ct.getMaxperson().isEmpty()) {
				ct.setType("RT"); // 지역과 체크인 체크아웃 예약 가능한 방 검색
				model.addAttribute("ct",ct);
			}
		}
		if(!ct.getCheckin().isEmpty()&&!ct.getCheckin().isEmpty()&&!ct.getMaxperson().isEmpty()) {
			if(ct.getRegion2().isEmpty()) {
				ct.setType("TM");
				log.info("ct"+ct);
				model.addAttribute("ct",ct);
			}
		}
		if(!ct.getRegion2().isEmpty()&&!ct.getMaxperson().isEmpty()) {
			if(ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()) {
				ct.setType("RM");
				model.addAttribute("ct",ct);
			}
		}
		if(!ct.getRegion2().isEmpty()&&!ct.getMaxperson().isEmpty()&&!ct.getCheckin().isEmpty()&&!ct.getCheckout().isEmpty()) {
			ct.setType("RTM");
			model.addAttribute("ct",ct);
		}
		
		log.info("1.type "+ct.getType());
		
		return "redirect:accommodationlist";
	}
	@GetMapping("/accommodationlist")
	public void postaccommodationlist(@ModelAttribute("ct")Criteria ct, Model model) {
		
				
		if("E".equals(ct.getType())) {
			List<AccommodationVO> list=homeservice.optionE(ct);
			for(AccommodationVO vo:list) {
				int ano=vo.getAno();
				HomeAttachVO vo2 = homeattservice.homeAttachList(ano);
				vo.setHomeAttach(new ArrayList<>());
				//log.info(vo+"");
				
				vo.getHomeAttach().add(vo2);
			}
			log.info(list+"E ct.getType()");
			model.addAttribute("list",list);
		}
		if("R".equals(ct.getType())) {
			List<AccommodationVO> list=homeservice.optionR(ct);
			for(AccommodationVO vo:list) {
				int ano=vo.getAno();
				HomeAttachVO vo2 = homeattservice.homeAttachList(ano);
				vo.setHomeAttach(new ArrayList<>());
				
				vo.getHomeAttach().add(vo2);
			}
			log.info(list+"R ct.getType()");
			model.addAttribute("list",list);
		}
		if("M".equals(ct.getType())) {
			List<AccommodationVO> list=homeservice.optionM(ct);
			for(AccommodationVO vo:list) {
				int ano=vo.getAno();
				HomeAttachVO vo2 = homeattservice.homeAttachList(ano);
				vo.setHomeAttach(new ArrayList<>());
				
				vo.getHomeAttach().add(vo2);
				log.info(vo+"");
			}
			log.info(list+"M ct.getType()");
			model.addAttribute("list",list);
		}
		if("T".equals(ct.getType())) {
			List<AccommodationVO> list=homeservice.optionT(ct);
			for(AccommodationVO vo:list) {
				int ano=vo.getAno();
				HomeAttachVO vo2 = homeattservice.homeAttachList(ano);
				vo.setHomeAttach(new ArrayList<>());
				
				vo.getHomeAttach().add(vo2);
				log.info(vo+"");
			}
			log.info(list+"T ct.getType()");
			model.addAttribute("list",list);
		}
		if("RT".equals(ct.getType())) {
			List<AccommodationVO> list=homeservice.optionRT(ct);
			for(AccommodationVO vo:list) {
				int ano=vo.getAno();
				HomeAttachVO vo2 = homeattservice.homeAttachList(ano);
				vo.setHomeAttach(new ArrayList<>());
				
				vo.getHomeAttach().add(vo2);
				log.info(vo+"");
			}
			log.info(list+"RT ct.getType()");
			
			model.addAttribute("list",list);
		}
		if("TM".equals(ct.getType())) {
			List<AccommodationVO> list=homeservice.optionTM(ct);
			for(AccommodationVO vo:list) {
				int ano=vo.getAno();
				HomeAttachVO vo2 = homeattservice.homeAttachList(ano);
				vo.setHomeAttach(new ArrayList<>());
				
				vo.getHomeAttach().add(vo2);
				log.info(vo+"");
			}
			log.info(list+"TM ct.getType()");
			model.addAttribute("list",list);
		}
		if("RM".equals(ct.getType())) {
			List<AccommodationVO> list=homeservice.optionRM(ct);
			for(AccommodationVO vo:list) {
				int ano=vo.getAno();
				HomeAttachVO vo2 = homeattservice.homeAttachList(ano);
				vo.setHomeAttach(new ArrayList<>());
				
				vo.getHomeAttach().add(vo2);
				log.info(vo+"");
			}
			log.info(list+"RM ct.getType()");
			model.addAttribute("list",list);
		}
		if("RTM".equals(ct.getType())) {
			List<AccommodationVO> list=homeservice.optionRTM(ct);
			for(AccommodationVO vo:list) {
				int ano=vo.getAno();
				HomeAttachVO vo2 = homeattservice.homeAttachList(ano);
				vo.setHomeAttach(new ArrayList<>());
				
				vo.getHomeAttach().add(vo2);
				log.info(vo+"");
			}
			log.info(list+"RTM ct.getType()");
			model.addAttribute("list",list);
		}
		
		log.info("type "+ct.getType());
	}
	
	@PostMapping("/headsearch")
	public String accommodationlisthead(Criteria ct, Model model) {
		log.info("헤더 검색창 확인"+ct.getRegion2());
		ct.setType("R"); // 지역만 입력하고 검색
		model.addAttribute("ct",ct);
		
		return "redirect:accommodationlist";
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
	
	//고객센터
	@GetMapping("/question")
	public String question(Model model) {
		boolean question=true;
		
		model.addAttribute("question",question);
		log.info("확인"+model);
		log.info("확인"+question);
		return"AirVienna/costomercenter";
	}
	@GetMapping("/costomersound")
	public String costomersound(Model model) {
		boolean costomersound=true;
		
		model.addAttribute("costomersound",costomersound);
		log.info("확인"+model);
		log.info("확인"+costomersound);
		return"AirVienna/costomercenter";
	}
	@GetMapping("/inform")
	public String inform(Model model) {
		boolean inform=true;
		
		model.addAttribute("inform",inform);
		log.info("확인"+inform);
		return"AirVienna/costomercenter";
	}
	@GetMapping("/costomercenter")
	public void costomercenter() {
		
	}
	//고객센터 종료

	@GetMapping("/Readpage")
	public void readpage(AccommodationVO vo, Model model, int ano) {
		vo = homeservice.getPage(ano);
		log.info("리드 페이지 호출");
		log.info("vo는 오는지" + vo);
		model.addAttribute("vo",vo);
	}
	
	@PostMapping(value = "/Readpage")
	public String toPay(Model model,ReserveVO vo, AccommodationVO product)  {
	
		log.info("예약 : "+vo);
		product = homeservice.getPage(1);
		model.addAttribute("vo",product);
		model.addAttribute("resev",vo);
		return "AirVienna/pay";
	}
	
	@GetMapping("/completePay")
	public void completePay() {
		log.info("Complete buy");
	}
	
	// 너무 하기 싫은 사진 가져오는 것
	@GetMapping("/getAttachList")
	public ResponseEntity<List<HomeAttachVO>> getAttachList(int ano) {
		log.info("집 등록에 사용된 사진 가져오기 : ");
		
		return new ResponseEntity<List<HomeAttachVO>>(homeattservice.attachList(ano),HttpStatus.OK);
	}
	
	
}