package com.spring.domain;

import lombok.Data;

@Data
public class HomeAttachVO {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private int ano;
}
