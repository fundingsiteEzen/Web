package com.fun.myPage.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.fun.myPage.dto.accountInfoDTO;
import com.fun.myPage.dto.backerDTO;
import com.fun.myPage.dto.cardInfoDTO;
import com.fun.myPage.dto.userinfoDTO;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

public interface myDAO {

	// (1)-1 후원자 테이블 가져오기
	public List<backerDTO> getBacker(String id) throws Exception;
	
	// (1)-2 프로젝트 테이블 가져오기(후원목록)
	public projectDTO getProject_back(String p_seq) throws Exception;
	
	// 리워드 테이블 가져오기
	public rewardDTO getReward_back(int p_seq, int r_seq) throws Exception;
	
	// (1)-3 프로젝트 테이블 가져오기(관심목록)
	public projectDTO getProject_like(String p_seq) throws Exception;
	
	// (후원취소) - backer
	public int deleteProject(backerDTO bDTO) throws Exception;
	
	// (후원취소) - project
	public int cancel_project(projectDTO dto) throws Exception;
	
	// (후원취소) - reward
	public int cancel_reward(rewardDTO dto) throws Exception;
	
	// 내 프로젝트 가져오기
	public List<projectDTO> getMyProject(String id) throws Exception;
		
	// 등록한 프로젝트 삭제
	public int deleteMyProject(projectDTO dto) throws Exception;
	
	// 등록한 프로젝트 삭제시 찜목록, 후원목록 삭제
	public int deleteMyProject2(backerDTO dto) throws Exception;
		
	// 카드 정보 입력
	public int addCard(cardInfoDTO cDTO) throws DataAccessException;
	
	// 계좌 정보 입력
	public int addAccount(accountInfoDTO aDTO) throws DataAccessException;
	

   // 카드정보 가져오기
   public List<cardInfoDTO> List_CARD(String id) throws Exception;
   
   // 계좌정보 가져오기
   public List<accountInfoDTO> List_ACCOUNT(String id) throws Exception;
	
	// 회원 정보 수정
	public int mymyUpdate(userinfoDTO UserinfoDTO);

	public int updateProfile(userinfoDTO userinfoDTO);

	public userinfoDTO getUserInfo(String string);

	public int deleteCard(cardInfoDTO cDTO);

	public int deleteAccount(accountInfoDTO aDTO);
	
	// 회원 탈퇴
	public int drop_User(String id) throws Exception;

}
