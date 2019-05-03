package com.spring.domain;

import lombok.Data;

@Data
public class ChangePwd {
	private String email;
	private String password;
	private String curruent_password;
	private String check_password;
}
