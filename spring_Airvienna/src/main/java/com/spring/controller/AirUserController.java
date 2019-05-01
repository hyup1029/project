package com.spring.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.AccommodationVO;
import com.spring.domain.AirUserVO;
import com.spring.service.AirUserService;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/AirVienna/*")
@Slf4j
@SessionAttributes("info")
public class AirUserController {
	
	@Inject
	private AirUserService service;
	
	@GetMapping("/joinpage")
	public void join() {
		log.info("회원가입 page....");
	};
	
	@PostMapping("/joinpage")
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
	public String loginPost(AirUserVO vo,Model model)  {
		log.info("로그인..."+vo.toString());
		AirUserVO info = service.login(vo);
		if(info == null) {
			log.info("틀렸음");
			return "redirect:mainpage";
		}else {
			//log.info("로그인정보..."+vo.toString());
			log.info("정보 : "+info.getEmail()+info.getUsername());
			model.addAttribute("info",info);
			return "redirect:mainpage";
		}
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("로그아웃...");
		status.setComplete();
		//session.removeAttribute("info");
		return "redirect:mainpage";
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

