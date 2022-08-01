package com.fun.subPage.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fun.subPage.dao.subDAO;
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

	
	
	
}
