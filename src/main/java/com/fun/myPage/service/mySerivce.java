package com.fun.myPage.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dto.projectDTO;

public interface mySerivce {

	// 아이디로 정보 가져오기
	public List<backerDTO> getBacker(String id) throws Exception;
	
	// 후원목록 가져오기
	public List<projectDTO> getProject_back(List<backerDTO> bList) throws Exception;
	
	// 관심목록 가져오기
	public List<projectDTO> getProject_Like(List<backerDTO> bList) throws Exception;
	
	// 후원 삭제하기
	public int deleteProject(String p_seq) throws Exception;

}
