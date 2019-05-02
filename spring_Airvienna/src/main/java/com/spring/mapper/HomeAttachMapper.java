package com.spring.mapper;

import java.util.List;

import com.spring.domain.HomeAttachVO;

public interface HomeAttachMapper {
	
	public int insertHomeAttach(HomeAttachVO attach);
	public HomeAttachVO homeAttachList(int ano);
	public List<HomeAttachVO> findByAno(int ano);
}
