package com.fun.myPage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.fun.myPage.dto.accountInfoDTO;
import com.fun.myPage.dto.backerDTO;
import com.fun.myPage.dto.cardInfoDTO;
import com.fun.myPage.dto.userinfoDTO;
import com.fun.subPage.dto.projectDTO;

@Repository
public class myDAOImpl implements myDAO{

	@Autowired
	private SqlSession sqlsession;
	
	private static String namespace = "com.fun.myPage";
	
	// (1)-1 후원자 테이블 가져오기
	public List<backerDTO> getBacker(String id) throws Exception {
		System.out.println("마이 DAO (1) 실행");
		return sqlsession.selectList(namespace + ".backerInfo", id);
	}
	
	// (1)-2 프로젝트 테이블 가져오기(후원목록)
	public projectDTO getProject_back(String p_seq) throws Exception {
		
		return sqlsession.selectOne(namespace + ".projectInfo", p_seq);
	}
	
	// (1)-3 프로젝트 테이블 가져오기(관심목록)
	public projectDTO getProject_like(String p_seq) throws Exception {
		
		return sqlsession.selectOne(namespace + ".projectInfo", p_seq);
	}

	// 후원 취소
	@Override
	public int deleteProject(backerDTO bDTO) throws Exception {
		
		return sqlsession.delete(namespace + ".deleteProject", bDTO);
	}

	// 카드 정보 입력
	@Override
	public int addCard(cardInfoDTO cDTO) throws DataAccessException {

		System.out.println("myDAOImpl에서 받은 cardInfoDTO ==> " + cDTO);
		int result = sqlsession.insert(namespace + ".addCard", cDTO);
		return result;

	}

	// 계좌정보입력
	@Override
	public int addAccount(accountInfoDTO aDTO) throws DataAccessException {

		System.out.println("myDAOImpl에서 받은 accountInfoDTO ==> " + aDTO);
		int result = sqlsession.insert(namespace + ".addAccount", aDTO);
		return result;

	}
	
	   // 카드 정보 가져오기
	   @Override
	   public List<cardInfoDTO> List_CARD(String id) throws Exception {

	      System.out.println("cardDAOImpl List_CARD() 시작");
	      
	      List<cardInfoDTO> List_CARD = sqlsession.selectList(namespace + ".cardList", id);
	      
	      System.out.println("cardDAOImpl List_CARD() Data ==> " + List_CARD);
	      
	      return List_CARD;
	      
	   }
	   // 계좌 정보 가져오기
	   @Override
	   public List<accountInfoDTO> List_ACCOUNT(String id) throws Exception {

	      System.out.println("accountDAOImpl List_ACCOUNT() 시작");
	      
	      List<accountInfoDTO> List_ACCOUNT = sqlsession.selectList(namespace + ".accountList", id);
	      
	      System.out.println("accountDAOImpl List_ACCOUNT() Data ==> " + List_ACCOUNT);
	      
	      return List_ACCOUNT;
	      
	   }
	// 회원 정보 수정
	@Override
		public int mymyUpdate(userinfoDTO UserinfoDTO) {
			return sqlsession.update(namespace + ".updateUserInfo", UserinfoDTO);
		}
		
		public int updateProfile(userinfoDTO UserinfoDTO) {
			return sqlsession.update(namespace + ".updateProfile", UserinfoDTO);
		}

		@Override
		public userinfoDTO getUserInfo(String string) {
			return sqlsession.selectOne(namespace + ".getUserInfo", string);
		}

		@Override
		public int deleteCard(cardInfoDTO cDTO) {
			// TODO Auto-generated method stub
			return sqlsession.delete(namespace + ".deleteCard", cDTO);
		}

		@Override
		public int deleteAccount(accountInfoDTO aDTO) {
			// TODO Auto-generated method stub
			return sqlsession.delete(namespace + ".deleteAccount", aDTO);
		}
	

}
