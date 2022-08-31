package com.fun.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fun.myPage.dao.IdAO;
import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

@Service
public class Iservice {
	
	@Autowired
	IdAO dao;

//	// backer 테이블 수정
//	public int cancel_back(backerDTO dto) {
//		return dao.cancel_back(dto);
//	}
//	
//	// 프로젝트 테이블 수정
//	public int cancel_project(projectDTO dto) {
//		return dao.cancel_project(dto);
//	}
//	
//	// 리워드 테이블 수정
//	public int cancel_reward(rewardDTO dto) {
//		return dao.cancel_reward(dto);
//	}
	
}
