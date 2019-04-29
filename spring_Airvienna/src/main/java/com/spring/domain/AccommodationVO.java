package com.spring.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class AccommodationVO {
	private int ano;
	private String homename;
	private int maxperson;
	private String birfcontent;
	private String content;
	private int price;
	private int bedcount;
	private boolean breakfast;
	private boolean parkingarea;
	private boolean wifi;
	private Date registDate;
	private Date checkin;
	private Date checkout;
	private int ReplyCnt;
	private String region;
	private int bno;
	
	//파일 첨부 목록 추가하기
	
	private List<HomeAttachVO> HomeAttach;
}
