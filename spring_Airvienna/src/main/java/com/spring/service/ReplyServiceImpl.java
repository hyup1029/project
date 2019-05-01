package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.domain.ReplyVO;
import com.spring.mapper.ReplyMapper;

@Service("reply")
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyMapper mapper;
	@Override
	public List<ReplyVO> replyList(int ano) {
		// TODO Auto-generated method stub
		return mapper.replyList(ano);
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.replyInsert(vo);
	}

}
