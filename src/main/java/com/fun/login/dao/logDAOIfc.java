package com.fun.login.dao;

import com.fun.subPage.dto.userinfoDTO;

public interface logDAOIfc {

	// (1) 해당 아이디가 존재하는지 조회하기
	public userinfoDTO searchID(String id) throws Exception;
	
}
