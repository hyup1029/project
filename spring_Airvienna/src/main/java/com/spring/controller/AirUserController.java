package com.spring.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.AirUserVO;
import com.spring.service.AirUserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/AirVienna/*")
@Slf4j
public class AirUserController {
	
	@Inject
	private AirUserService service;
	
	@GetMapping("/joinpage")
	public void join() {
		log.info("회원가입 page....");
	};
	
	@PostMapping("/joinpage")
	public String joinpost(AirUserVO vo) {
		log.info("회원가입 성공"+vo.toString());
		if(service.insert(vo)) {
			return "redirect:mainpage";
		}
		return "redirect:joinpage";
	}
	
	@GetMapping("/mainpage")
	public void main() {
		log.info("main page...");
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
}
