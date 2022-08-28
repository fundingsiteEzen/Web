package com.fun.crpage.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.fun.crpage.dto.CrDTO;
import com.fun.crpage.dto.rewardDTO;

//-----------------------------------------------------------------------------------------------------------
// public class CrDAOImpl implements CrDAO
//-----------------------------------------------------------------------------------------------------------
@Repository

public class CrDAOImpl implements CrDAO {

	@Inject
	private SqlSession sqlSession;

	
	//-----------------------------------------------------------------------------------------------------------
	// 프로젝트 등록 처리 
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int crInsert(CrDTO crDTO) throws DataAccessException {

		System.out.println("CrDAOImpl의 crInsert() crDTO데이터 =>" + crDTO);
		int result = sqlSession.insert("com.fun.crpage.register", crDTO);
		return result;
	}


	// (2) 리워드 등록
	@Override
	public int insertReward(rewardDTO dto) {
		
		System.out.println("crDAO (2) 실행");
		return sqlSession.insert("com.fun.crpage.insertReward", dto);
	}
	
}
