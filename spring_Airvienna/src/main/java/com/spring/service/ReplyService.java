package com.spring.service;

import java.util.List;

import com.spring.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> replyList(int ano);
	public int replyInsert(ReplyVO vo);
	public int replyCnt(int ano);
}
