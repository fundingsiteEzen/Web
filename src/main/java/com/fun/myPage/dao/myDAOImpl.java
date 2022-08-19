package com.fun.myPage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dto.projectDTO;

@Repository
public class myDAOImpl implements myDAO{

	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "com.fun.myPage";
	
	// (1)-1 후원자 테이블 가져오기
	public List<backerDTO> getBacker(String id) throws Exception {
		System.out.println("마이 DAO (1) 실행");
		return sqlsession.selectList(namespace + ".backerInfo", id);
	}
	
	// (1)-2 프로젝트 테이블 가져오기(후원목록)
	public projectDTO getProject_back(String p_seq) throws Exception {
		
		return sqlsession.selectOne(namespace + ".projectInfo", p_seq);
	}
	
	// (1)-3 프로젝트 테이블 가져오기(관심목록)
	public projectDTO getProject_like(String p_seq) throws Exception {
		
		return sqlsession.selectOne(namespace + ".projectInfo", p_seq);
	}

	// (1)-4 프로젝트 테이블 가져오기(후원삭제)
	@Override
	public int deleteProject(String p_seq) throws Exception {
		
		return sqlsession.delete(namespace + ".deleteProject", p_seq);
	}


}
