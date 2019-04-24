package com.spring.mapper;

import com.spring.domain.AirUserVO;

public interface AirUserMapper {
	public int insert(AirUserVO vo);
	public AirUserVO selectByEmail(String email);
}
