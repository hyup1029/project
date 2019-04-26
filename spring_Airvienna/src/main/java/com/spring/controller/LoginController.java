package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/AirVienna/*")
public class LoginController {
	
	@GetMapping("/login")
	public void login() {
		log.info("로그인 page...");
	}
}
