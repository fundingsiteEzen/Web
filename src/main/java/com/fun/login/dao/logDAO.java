package com.fun.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fun.subPage.dto.newUserinfoDTO;
import com.fun.subPage.dto.userinfoDTO;

@Repository
public class logDAO {

	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "com.fun.login";
	
	// (1) 해당 아이디가 존재하는지 조회하기
	// 유저정보를 찾아서 서비스쪽으로 넘겨줌
	public userinfoDTO searchID(String id) throws Exception {
		
		System.out.println("로그인 DAO1 실행");
		
		return sqlsession.selectOne(namespace + ".searchid", id);
	}
	
	
	// (3) 회원가입
	public int addMember(userinfoDTO userinfo) {
		
		System.out.println("회원가입(3)dao 실행");
		
		return sqlsession.insert(namespace + ".addMember", userinfo);
	}
	
	
	// 아이디 중복체크
	public int checkID(String id) throws Exception {
		
		System.out.println("회원가입 아이디 중복체크");
		
		return sqlsession.selectOne(namespace + ".checkID", id);
	}

}
