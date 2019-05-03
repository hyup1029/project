package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.AccommodationVO;
import com.spring.domain.AirUserVO;
import com.spring.domain.ChangePwd;
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

	@Override
	public int changePwd(ChangePwd vo) {
		return mapper.changePwd(vo);
	}

	@Override
	public boolean profile_modify(AirUserVO vo) {
		return mapper.profile_modify(vo)==1;
	}

	@Override
	public int userdelete(String email) {
		return mapper.userdelete(email);
	}



}
