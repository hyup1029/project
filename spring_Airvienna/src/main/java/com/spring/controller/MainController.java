package com.spring.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.AccommodationVO;
import com.spring.domain.AirUserVO;
import com.spring.domain.Criteria;
import com.spring.domain.ReserveVO;
import com.spring.domain.jjimVO;
import com.spring.service.AccommodationService;
import com.spring.service.AirUserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/AirVienna/*")
public class MainController {
	@Inject
	private AccommodationService service;
	@Inject
	private AirUserService Airservice;
	
	
	@GetMapping("/mypage")
	public String mypage() {
		
		return "AirVienna/Mypage";
	}
	@GetMapping("/home_register")
	public String home_register() {
		
		return "AirVienna/home_register";
	}
	
	@GetMapping("/profile")
	public void profilePage(int bno,Model model){
		log.info("프로필페이지 호출...");
		AirUserVO vo = Airservice.profile(bno);
		model.addAttribute("vo"+vo);
		
	}	
	@GetMapping("/password_change")
	public void passwordPage(){
		log.info("프로필페이지 호출...");
	}	
	
	@GetMapping("/Readpage")
	public void readpage(AccommodationVO vo, Model model) {
		vo = service.getPage(43);
		log.info("리드 페이지 호출");
		log.info("vo는 오는지" + vo);
		model.addAttribute("vo",vo);
	}
	@GetMapping("/costomercenter")
	public void costomercenter() {
		
	}
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
	
	@PostMapping(value = "/Readpage")
	public String toPay(Model model,ReserveVO vo, AccommodationVO product)  {

		log.info("예약 : "+vo);
		product = service.getPage(1);
		model.addAttribute("vo",product);
		model.addAttribute("resev",vo);
		return "AirVienna/pay";
	}
	
	@GetMapping("/completePay")
	public void completePay() {
		log.info("Complete buy");
	}
}
