package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.AccommodationVO;
import com.spring.domain.HomeAttachVO;
import com.spring.mapper.HomeAttachMapper;
import com.spring.mapper.HomeRegisterMapper;

@Service
public class HomeRegisterServiceImpl implements HomeRegisterService {

	@Autowired
	private HomeRegisterMapper mapper;
	@Autowired
	private HomeAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void homeRegister(AccommodationVO vo) {
		mapper.homeRegister(vo);
		
		// 파일 첨부 등록
		if(vo.getHomeAttach() == null || vo.getHomeAttach().size() <= 0) {
			return;
		}
		
		for(HomeAttachVO attach : vo.getHomeAttach()) {
			attach.setAno(vo.getAno());
			attachMapper.insertHomeAttach(attach);
		}
		
	}

	@Override
	public List<HomeAttachVO> findByAno(int ano) {
		return attachMapper.findByAno(ano);
	}

	@Override
	public HomeAttachVO homeAttachList(int ano) {
		return attachMapper.homeAttachList(ano);
	}


}
