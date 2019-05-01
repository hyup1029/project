package com.spring.mapper;

import java.util.List;

import com.spring.domain.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> replyList(int ano);
	public int replyInsert(ReplyVO vo);
}
