package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/AirVienna/*")
public class MainController {
	
	
	@GetMapping("/mainpage")
	public void mainpage() {
		log.info("메인페이지 호출...");
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		
		return "AirVienna/Mypage";
	}
	
	@GetMapping("/accommodationlist")
	public void listpage(){
		log.info("리스트페이지 호출...");
	}
}