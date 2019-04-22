package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/airvienna/*")
public class MainController {
	
	
	@GetMapping("/mainpage")
	public String mainpage() {
		log.info("메인페이지 호출...");
		return "AirVienna/mainpage";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		
		return "AirVienna/Mypage";
	}
	
}
