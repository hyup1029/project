package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int cno;
	private int ano;
	private String content;
	private String writer;
	private Date regdate;

}
