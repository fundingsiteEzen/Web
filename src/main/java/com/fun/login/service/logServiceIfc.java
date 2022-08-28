package com.fun.login.service;

import com.fun.subPage.dto.newUserinfoDTO;
import com.fun.subPage.dto.userinfoDTO;

public interface logServiceIfc {

	// 로그인 처리
	public userinfoDTO login(userinfoDTO userinfo) throws Exception;
	
	// 3. 회원가입
	public int addMember(newUserinfoDTO userinfo) throws Exception;
	
	// 아이디 중복체크
	public int checkId(String id) throws Exception;
	
}
