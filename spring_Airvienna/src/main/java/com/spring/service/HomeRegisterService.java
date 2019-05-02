package com.spring.service;

import java.util.List;

import com.spring.domain.AccommodationVO;
import com.spring.domain.HomeAttachVO;

public interface HomeRegisterService {

	public void homeRegister(AccommodationVO vo);
	
	
	
	// 첨부파일 목록
	public HomeAttachVO homeAttachList(int ano);
	public List<HomeAttachVO> findByAno(int ano);
	
}
