package com.fun.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fun.subPage.dto.userinfoDTO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "com.fun.login";
	
	public userinfoDTO selectUserInfo(String id) throws Exception {
		
		System.out.println("UserDAO 실행");
		
		return sqlsession.selectOne(namespace + ".getInfo", id);
	}
	
}
