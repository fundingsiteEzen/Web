package com.fun.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fun.subPage.dto.newUserinfoDTO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "com.fun.login";
	
	// 로그인
	public newUserinfoDTO selectUserInfo(String id) throws Exception {
		
		System.out.println("UserDAO 실행");
		
		return sqlsession.selectOne(namespace + ".getInfo", id);
	}
	
	// 회원가입
	public int register(newUserinfoDTO userinfo) throws Exception {
		
		System.out.println("회원가입 dao");
		
		return sqlsession.insert(namespace + ".register", userinfo);
	}
	
}
