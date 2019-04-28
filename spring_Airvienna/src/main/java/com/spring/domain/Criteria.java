package com.spring.domain;

import lombok.Data;

@Data
public class Criteria {
	
	//검색폼 정보 처리
	private String type;
	private String region;
	private String checkin;
	private String checkout;
	private String maxperson;
	
	public String[] getTypeArr() {
		return type==null? new String[] {} : type.split("");
	}
}
