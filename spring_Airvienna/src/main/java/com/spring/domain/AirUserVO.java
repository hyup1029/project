package com.spring.domain;





import java.util.List;

import lombok.Data;

@Data
public class AirUserVO {
	private int bno;
	private String email;
	private String password;
	private String username;
	private String address;
	private String tel;
	private String birth;
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private List<AirUserVO> attachList;
}

