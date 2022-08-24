package com.fun.login.service;

import org.springframework.dao.DataAccessException;

import com.fun.subPage.dto.userinfoDTO;

public interface logServiceIfc {

	// 로그인 처리
	public userinfoDTO login(userinfoDTO userinfo) throws Exception;
	
}
