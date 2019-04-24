package com.spring.service;

import com.spring.domain.AirUserVO;

public interface AirUserService {
	public boolean insert(AirUserVO vo);
	public AirUserVO selectByEmail(String email);
}
