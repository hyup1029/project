package com.spring.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.ReplyVO;
import com.spring.service.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/comment/*")
public class ReplyController {
	 
	@Inject
	ReplyService service;
	
	@GetMapping("/list")
	@ResponseBody
	public List<ReplyVO> replyList() {
		
		log.info("cccc");
		
		return service.replyList(43);
		
	}
	
	@PostMapping("/insert")
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO vo) {
		
		service.replyInsert(vo);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
}
