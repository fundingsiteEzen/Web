package com.fun.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.fun.login.service.UserService;
import com.fun.subPage.dto.userinfoDTO;

public class UserDAO {

	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "com.fun.login";
	
	public userinfoDTO selectUserInfo(String id) throws Exception {
		
		System.out.println("UserDAO 실행");
		
		return sqlsession.selectOne(namespace + ".getInfo", id);
	}
	
}
