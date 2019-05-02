package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.AccommodationVO;
import com.spring.domain.AirUserVO;
import com.spring.mapper.AirUserMapper;

@Service
public class AirUserServiceImpl implements AirUserService {

	@Inject
	private AirUserMapper mapper;
	
	@Override
	public boolean insert(AirUserVO vo) {
		return mapper.insert(vo)==1;
	}

	@Override
	public AirUserVO selectByEmail(String email) {
		return mapper.selectByEmail(email);
	}

	@Override
	public AirUserVO login(AirUserVO vo) {
		return mapper.login(vo);
	}

	@Override
	public AirUserVO profile(int bno) {
		return mapper.profile(bno);
	}



}
