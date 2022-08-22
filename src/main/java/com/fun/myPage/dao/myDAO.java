package com.fun.myPage.dao;

import java.util.List;

import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dto.projectDTO;

public interface myDAO {

	// (1)-1 후원자 테이블 가져오기
	public List<backerDTO> getBacker(String id) throws Exception;
	
	// (1)-2 프로젝트 테이블 가져오기(후원목록)
	public projectDTO getProject_back(String p_seq) throws Exception;
	
	// (1)-3 프로젝트 테이블 가져오기(관심목록)
	public projectDTO getProject_like(String p_seq) throws Exception;
	
	// (후원취소)
	public int deleteProject(backerDTO bDTO) throws Exception;
	
}
