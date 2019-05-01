package com.spring.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.AccommodationVO;
import com.spring.domain.HomeAttachVO;
import com.spring.service.HomeRegisterService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/AirVienna/*")
public class HomeController {

	@Autowired
	private HomeRegisterService service;
	
	
	@PostMapping("/home_register")
	public String homeRegister(AccommodationVO vo) {
		log.info("집정보 등록...");
		log.info(vo+"aa");
		if(vo.getHomeAttach() != null) {
			for (HomeAttachVO attach : vo.getHomeAttach()) {
				log.info("" + attach);
			}
		}
		service.homeRegister(vo);
		return "redirect:accommodationlist";
		
	}
	
}
