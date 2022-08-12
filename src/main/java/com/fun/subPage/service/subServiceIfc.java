package com.fun.subPage.service;

import java.util.List;

import com.fun.subPage.dto.creatorDTO;
import com.fun.subPage.dto.projectDTO;

public interface subServiceIfc {

	// (1) 프로젝트 테이블 가져오기
	public projectDTO projectList(String p_seq) throws Exception;
	
	// (2) 리워드 테이블 가져오기
	public List<projectDTO> rewardList(String p_seq) throws Exception;
	
	// (3) 창작자 테이블 가져오기
	public creatorDTO creatorList(String id) throws Exception;
	
}
