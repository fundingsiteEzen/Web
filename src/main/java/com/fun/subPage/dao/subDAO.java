package com.fun.subPage.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dto.creatorDTO;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

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

	// (3) 창작자 테이블 가져오기
	@Override
	public creatorDTO creatorList(String id) throws Exception {

		System.out.println("서브DAO (3) 실행");
		
		return sqlsession.selectOne(namespace + ".listCreator", id);
	}

	// (4) 후원자 테이블에 저장하기
	@Override
	public int back_this(backerDTO dto) throws Exception {
		
		System.out.println("서브DAO (4) 실행");
		
		return sqlsession.insert(namespace + ".backProject", dto);
	}

	// (5) 중복검사
	@Override
	public int check_back(backerDTO dto) throws Exception {
		
		System.out.println("dao(5) 중복검사");
		
		return sqlsession.selectOne(namespace + ".getBacker", dto);
	}

	// (6) 프로젝트 테이블 수정하기 (후원자 수, 후원금액 +)
	@Override
	public int up_project(projectDTO dto) throws Exception {
		
		System.out.println("서브 DAO (6) 실행");
		
		return sqlsession.update(namespace + ".updateProject", dto);
	}

	// (7) 리워드 테이블 수정하기 (남은수량 -1)
	@Override
	public int up_reward(rewardDTO dto) throws Exception {

		System.out.println("서브 DAO (7) 실행");
		
		return sqlsession.update(namespace + ".updateReward", dto);
	}
	
}
