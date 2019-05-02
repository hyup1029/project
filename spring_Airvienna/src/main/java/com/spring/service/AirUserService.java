package com.spring.service;

import com.spring.domain.AccommodationVO;
import com.spring.domain.AirUserVO;

public interface AirUserService {
	public boolean insert(AirUserVO vo);
	public AirUserVO login(AirUserVO vo);
	public AirUserVO selectByEmail(String email);
	public AirUserVO profile(int bno);
	public boolean profile_modify(AirUserVO vo);

}
