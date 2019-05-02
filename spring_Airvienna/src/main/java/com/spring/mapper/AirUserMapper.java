package com.spring.mapper;

import java.util.List;


import com.spring.domain.AirUserVO;
import com.spring.domain.ChangePwd;

public interface AirUserMapper {
	public int insert(AirUserVO vo);
	public AirUserVO login(AirUserVO vo);
	public AirUserVO selectByEmail(String email);
	public AirUserVO profile(int bno);
	public int changePwd(ChangePwd vo);
	public AirUserVO selectByPassword(String password);
}
