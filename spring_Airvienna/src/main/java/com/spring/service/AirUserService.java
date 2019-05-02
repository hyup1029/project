package com.spring.service;

import com.spring.domain.AccommodationVO;
import com.spring.domain.AirUserVO;
import com.spring.domain.ChangePwd;

public interface AirUserService {
	public boolean insert(AirUserVO vo);
	public AirUserVO login(AirUserVO vo);
	public AirUserVO selectByEmail(String email);
	public AirUserVO profile(int bno);
	public int changePwd(ChangePwd vo);
	public AirUserVO selectByPassword(String password);
	public boolean profile_modify(AirUserVO vo);

}
