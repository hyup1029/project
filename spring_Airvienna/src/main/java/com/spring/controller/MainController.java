package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.AccommodationVO;
import com.spring.domain.Criteria;
import com.spring.domain.SearchType;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/AirVienna/*")
public class MainController {
	
	
	
	@GetMapping("/mainpage")
	public void mainpage() {
		log.info("메인페이지 호출...");
	}
	@PostMapping("/search")
	public String accommodationlist(SearchType type,Criteria ct) {
		log.info("등록하기"+type.getRegion());
		log.info("등록하기"+type.getCheckin());
		log.info("등록하기"+type.getCheckout());
		log.info("등록하기"+type.getMaxperson());
		
		if(!type.getRegion().isEmpty()) {
			if(type.getCheckin().isEmpty()&&type.getCheckout().isEmpty()&&type.getMaxperson().isEmpty()) {
				ct.setType("R");
			}
		}
		if(!type.getMaxperson().isEmpty()) {
			if(type.getCheckin().isEmpty()&&type.getCheckout().isEmpty()&&type.getRegion().isEmpty()) {
				ct.setType("M");
			}
		}
		if(!type.getCheckin().isEmpty()&&!type.getCheckin().isEmpty()) {
			if(type.getRegion().isEmpty()&&type.getMaxperson().isEmpty()) {
				ct.setType("T");
			}
		}
		if(!type.getCheckin().isEmpty()&&!type.getCheckin().isEmpty()&&!type.getRegion().isEmpty()) {
			if(type.getMaxperson().isEmpty()) {
				ct.setType("RT");
			}
		}
		if(!type.getCheckin().isEmpty()&&!type.getCheckin().isEmpty()&&!type.getMaxperson().isEmpty()) {
			if(type.getRegion().isEmpty()) {
				ct.setType("TM");
			}
		}
		if(!type.getRegion().isEmpty()&&!type.getMaxperson().isEmpty()) {
			if(type.getCheckin().isEmpty()&&type.getCheckout().isEmpty()) {
				ct.setType("RM");
			}
		}
		if(!type.getRegion().isEmpty()&&!type.getMaxperson().isEmpty()&&!type.getCheckin().isEmpty()&&!type.getCheckout().isEmpty()) {
			ct.setType("RTM");
		}
		if(type.getRegion().isEmpty()&&type.getMaxperson().isEmpty()&&type.getCheckin().isEmpty()&&type.getCheckout().isEmpty()) {
			ct.setType("E");
		}
		
		log.info("type "+ct.getType());
		
		return "AirVienna/accommodationlist";
	}
	
	@GetMapping("/mypage")
	public String mypage() {
		
		return "AirVienna/Mypage";
	}
	@GetMapping("/home_register")
	public String home_register() {
		
		return "AirVienna/home_register";
	}
	
	@GetMapping("/accommodationlist")
	public void listpage(){
		log.info("리스트페이지 호출...");
	}
}
