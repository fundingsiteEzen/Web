package com.fun.subPage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dao.subDAO;
import com.fun.subPage.dto.creatorDTO;
import com.fun.subPage.dto.projectDTO;

@Service
public class subService implements subServiceIfc {

	@Inject
	subDAO dao;
	
	// (1) 프로젝트 테이블 가져오기
	@Override
	public projectDTO projectList(String p_seq) throws Exception {
		
		System.out.println("서브 Service (1) 실행");
		
		return dao.projectList(p_seq);
	}

	// (2) 리워드 테이블 가져오기
	@Override
	public List<projectDTO> rewardList(String p_seq) throws Exception {
		
		System.out.println("서브 Service (2) 실행");
		
		return dao.rewardList(p_seq);
	}

	// (3) 창작자 테이블 가져오기
	@Override
	public creatorDTO creatorList(String id) throws Exception {
		
		System.out.println("서브 Service (3) 실행");
		
		return dao.creatorList(id);
	}

	// (4) 후원자 테이블에 저장하기
	@Override
	public int back_this(backerDTO dto) throws Exception {
		
		System.out.println("서브 Service (4) 실행");
		
		return dao.back_this(dto);
	}
	
	// 중복검사
	public int check_back(backerDTO dto) throws Exception {
		
		System.out.println("서비스 중복검사");
		
		return dao.check_back(dto);
	}
	
	
	
}
