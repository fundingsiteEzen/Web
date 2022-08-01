package com.fun.subPage.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fun.subPage.dto.projectDTO;

@Repository
public class subDAO implements subDAOIfc {
	
	@Inject
	private SqlSession sqlsession;
	
	private static String namespace = "com.fun.subPage";

	// (1) 프로젝트 테이블 가져오기
	@Override
	public projectDTO projectList(String p_seq) throws Exception {
		
		System.out.println("서브DAO (1) 실행");
		
		return sqlsession.selectOne(namespace + ".listProject", p_seq);
	}

	// (2) 리워드 테이블 가져오기
	@Override
	public List<projectDTO> rewardList(String p_seq) throws Exception {
		
		System.out.println("서브DAO (2) 실행");
		
		return sqlsession.selectList((namespace) + ".listReward", p_seq);
	}
	
}
