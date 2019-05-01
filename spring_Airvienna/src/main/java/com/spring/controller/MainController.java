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
import com.spring.domain.Criteria;
import com.spring.domain.jjimVO;
import com.spring.service.AccommodationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/AirVienna/*")
public class MainController {
	@Inject
	private AccommodationService service;
	
	
	
	@GetMapping("/mypage")
	public String mypage() {
		
		return "AirVienna/Mypage";
	}
	@GetMapping("/home_register")
	public String home_register() {
		
		return "AirVienna/home_register";
	}
	
	@GetMapping("/profile")
	public void profilePage(){
		log.info("프로필페이지 호출...");
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
	
	
}
