package com.fun.myPage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

@Repository
public class IdAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	private String namespace = "com.fun.backDelete";

	// 프로젝트 테이블 수정
	public int cancel_project(projectDTO dto) {
		return 0;
	}
	
	// 리워드 테이블 수정
	public int cancel_reward(rewardDTO dto) {
		return 0;
	}

	
}
