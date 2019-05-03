package com.spring.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReserveVO {
	
	public int ano;
	public int result;
	public int people;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date checkin;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Date checkout;
	
}