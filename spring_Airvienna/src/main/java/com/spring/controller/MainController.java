package com.spring.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.AccommodationVO;
import com.spring.domain.Criteria;
import com.spring.service.AccommodationService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/AirVienna/*")
public class MainController {
	
	@Inject
	private AccommodationService service;
	
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
			List<AccommodationVO> list=service.optionE(ct);
			model.addAttribute("vo",list);
		}
		else if(!ct.getRegion().isEmpty()) {
			if(ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()&&ct.getMaxperson().isEmpty()) {
				ct.setType("R");
				List<AccommodationVO> list=service.optionRe(ct);
				model.addAttribute("vo",list);
			}
		}
		else if(!ct.getMaxperson().isEmpty()) {
			if(ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()&&ct.getRegion().isEmpty()) {
				ct.setType("M");
				List<AccommodationVO> list=service.optionM(ct);
				model.addAttribute("vo",list);
			}
		}
		else if(!ct.getCheckin().isEmpty()&&!ct.getCheckin().isEmpty()) {
			if(ct.getRegion().isEmpty()&&ct.getMaxperson().isEmpty()) {
				ct.setType("T");
				List<AccommodationVO> list=service.optionT(ct);
				model.addAttribute("vo",list);
			}
		}
		else if(!ct.getCheckin().isEmpty()&&!ct.getCheckin().isEmpty()&&!ct.getRegion().isEmpty()) {
			if(ct.getMaxperson().isEmpty()) {
				ct.setType("RT");
				List<AccommodationVO> list=service.optionRT(ct);
				model.addAttribute("vo",list);
			}
		}
		else if(!ct.getCheckin().isEmpty()&&!ct.getCheckin().isEmpty()&&!ct.getMaxperson().isEmpty()) {
			if(ct.getRegion().isEmpty()) {
				ct.setType("TM");
				List<AccommodationVO> list=service.optionTM(ct);
				model.addAttribute("vo",list);
			}
		}
		else if(!ct.getRegion().isEmpty()&&!ct.getMaxperson().isEmpty()) {
			if(ct.getCheckin().isEmpty()&&ct.getCheckout().isEmpty()) {
				ct.setType("RM");
				List<AccommodationVO> list=service.optionRM(ct);
				model.addAttribute("vo",list);
			}
		}
		else if(!ct.getRegion().isEmpty()&&!ct.getMaxperson().isEmpty()&&!ct.getCheckin().isEmpty()&&!ct.getCheckout().isEmpty()) {
			ct.setType("RTM");
			List<AccommodationVO> list=service.optionRTM(ct);
			model.addAttribute("vo",list);
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
