package com.fun.myPage.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.fun.myPage.dto.accountInfoDTO;
import com.fun.myPage.dto.backerDTO;
import com.fun.myPage.dto.cardInfoDTO;
import com.fun.myPage.dto.prDTO;
import com.fun.myPage.dto.userinfoDTO;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

public interface mySerivce {

	// 아이디로 정보 가져오기
	public List<backerDTO> getBacker(String id) throws Exception;
	
	// 후원목록 가져오기
	public prDTO getProject_back(List<backerDTO> bList) throws Exception;
	
	// 관심목록 가져오기
	public List<projectDTO> getProject_Like(List<backerDTO> bList) throws Exception;
	
	// *** 후원 삭제하기
	// backer 테이블 수정
	public int deleteProject(backerDTO bDTO) throws Exception;
	
	// *** 후원 삭제하기
	// 프로젝트 테이블 수정
	public int cancel_project(projectDTO dto) throws Exception;
	
	// *** 후원 삭제하기
	// 리워드 테이블 수정
	public int cancel_reward(rewardDTO dto) throws Exception;
	// 내 프로젝트 가져오기
	public List<projectDTO> getMyProject(String id) throws Exception;
			
	/*
	 * // 내 프로젝트 삭제하기 public int deleteMyProject() throws Exception;
	 */
	
	// 카드 정보 입력
	public int addCard(cardInfoDTO cDTO) throws DataAccessException;
	
	// 계좌 정보 입력
	public int addAccount(accountInfoDTO aDTO) throws DataAccessException;
	
	// 카드 정보 가져오기
    public List<cardInfoDTO> List_CARD(String id) throws Exception;
   
    // 계좌 정보 가져오기
    public List<accountInfoDTO> List_ACCOUNT(String id) throws Exception; 
    
	// 회원 정보 수정
	public int mymyUpdate(userinfoDTO UserinfoDTO);

	public int updateProfile(userinfoDTO dto);

	public userinfoDTO getUserInfo(String string);

	public int deleteCard(cardInfoDTO cDTO);

	public int deleteAccount(accountInfoDTO aDTO);

}
