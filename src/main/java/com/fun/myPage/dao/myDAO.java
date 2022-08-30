package com.fun.myPage.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.fun.category.dto.CategoryDTO;
import com.fun.myPage.dto.accountInfoDTO;
import com.fun.myPage.dto.backerDTO;
import com.fun.myPage.dto.cardInfoDTO;
import com.fun.subPage.dto.projectDTO;

public interface myDAO {

	// (1)-1 후원자 테이블 가져오기
	public List<backerDTO> getBacker(String id) throws Exception;
	
	// (1)-2 프로젝트 테이블 가져오기(후원목록)
	public projectDTO getProject_back(String p_seq) throws Exception;
	
	// (1)-3 프로젝트 테이블 가져오기(관심목록)
	public projectDTO getProject_like(String p_seq) throws Exception;
	
	// 나래- 내 프로젝트 가져오기
	public projectDTO getProject_My(String p_seq) throws Exception;
	
	// (후원취소)
	public int deleteProject(backerDTO bDTO) throws Exception;
	
	// 카드 정보 입력
	public int addCard(cardInfoDTO cDTO) throws DataAccessException;
	
	// 계좌 정보 입력
	public int addAccount(accountInfoDTO aDTO) throws DataAccessException;
	
	// 카드정보 가져오기
	public List<cardInfoDTO> List_CARD(String id) throws Exception;
	
	
}
