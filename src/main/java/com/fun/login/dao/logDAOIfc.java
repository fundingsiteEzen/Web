package com.fun.login.dao;

import com.fun.subPage.dto.newUserinfoDTO;
import com.fun.subPage.dto.userinfoDTO;

public interface logDAOIfc {

	// (1) 해당 아이디가 존재하는지 조회하기
	public userinfoDTO searchID(String id) throws Exception;
	
	// 회원가입
	public int addMember(userinfoDTO userinfo) throws Exception;
	
	// 아이디 중복체크
	public int checkID(String id) throws Exception;
	
}
