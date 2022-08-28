package com.fun.subPage.dao;

import java.util.List;

import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dto.creatorDTO;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

public interface subDAOIfc {
	
	// (1) 프로젝트 테이블 가져오기
	public projectDTO projectList(String p_seq) throws Exception;
	
	// (2) 리워드 테이블 가져오기
	public List<projectDTO> rewardList(String p_seq) throws Exception;
	
	// (3) 창작자 테이블 가져오기
	public creatorDTO creatorList(String id) throws Exception;
	
	// (4) 후원자 테이블에 저장하기
	public int back_this(backerDTO dto) throws Exception;
	
	// (5) 중복검사
	public int check_back(backerDTO dto) throws Exception;
	
	// (6) 프로젝트 테이블 수정하기 (후원자 수, 후원금액 +)
	public int up_project(projectDTO dto) throws Exception;
	
	// (7) 리워드 테이블 수정하기 (남은수량 -1)
	public int up_reward(rewardDTO dto) throws Exception;
	
}
