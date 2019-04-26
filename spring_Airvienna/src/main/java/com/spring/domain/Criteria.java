package com.spring.domain;

import lombok.Data;

@Data
public class Criteria {
	
	//검색폼 정보 처리
	private String type;
	private String keyword;
	
	public String[] getTypeArr() {
		return type==null? new String[] {} : type.split("");
	}
}
