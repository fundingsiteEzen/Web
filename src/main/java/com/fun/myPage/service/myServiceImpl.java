package com.fun.myPage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.fun.myPage.dao.myDAO;
import com.fun.myPage.dto.accountInfoDTO;
import com.fun.myPage.dto.backerDTO;
import com.fun.myPage.dto.cardInfoDTO;
import com.fun.myPage.dto.prDTO;
import com.fun.myPage.dto.userinfoDTO;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

@Service
public class myServiceImpl implements mySerivce {

	@Autowired
	myDAO dao;
	
	
	
	// (1) 정보 가져오기
	public List<backerDTO> getBacker(String id) throws Exception {
		
		System.out.println("마이 서비스 (1) 실행");
		
		List<backerDTO> bList = dao.getBacker(id); // DB에서 해당 아이디가 있는 'backer' 테이블을 가져옴. 여러개일 수도 있으므로 List로 받음
		System.out.println("getBacker가져온 데이터 : " + bList);
		return bList;
	}
	
	// (2) 후원목록 가져오기
	public prDTO getProject_back(List<backerDTO> bList) throws Exception {
		
		prDTO PR = new prDTO();
		
		// 가져온 테이블에서 p_seq만 뽑아서 'project' 테이블 가져오기
		List<projectDTO> pList = new ArrayList<projectDTO>(); // List 꼭 생성해줘야함.. ! null로 두면 안됨
		List<rewardDTO> rList = new ArrayList<rewardDTO>();
		List<Integer> addMoney = new ArrayList<Integer>();
		
			for(int i = 0; i < bList.size(); i++) {
				if(bList.get(i).getIs_like() == 'N') { // 'N'인 경우만 뽑음
					String p_seq = Integer.toString(bList.get(i).getP_seq());
					pList.add(dao.getProject_back(p_seq));
					
					// p_seq를 뽑으면서 r_seq도 같이 뽑음. 두개 붙혀서 리워드 테이블 가져오기
					int r_seq = bList.get(i).getR_seq();
					rList.add(dao.getReward_back(bList.get(i).getP_seq(), r_seq));
					
					// 추가후원금 가져오기
					addMoney.add(bList.get(i).getR_addMoney());
				}
			}
			PR.setpList(pList);
			PR.setrDTO(rList);
			PR.setAddMoney(addMoney);
			System.out.println("for문 끝난 데이터 :" + pList);
			System.out.println("for문 끝난 리워드 데이터 :" + rList);
		
		// 'projcet' 테이블을 List에 담아서 컨트롤러로 보냄
		return PR;
	}

	// (3) 관심목록 가져오기
	public List<projectDTO> getProject_Like(List<backerDTO> bList) throws Exception {
		List<projectDTO> pList = new ArrayList<projectDTO>(); // List 꼭 생성해줘야함.. ! null로 두면 안됨
		
			for(int i = 0; i < bList.size(); i++) {
				if(bList.get(i).getIs_like() == 'Y') { // 'Y'인 경우만 뽑음
					String p_seq = Integer.toString(bList.get(i).getP_seq());
					pList.add(dao.getProject_back(p_seq));
				}
			}
			System.out.println("for문 끝난 데이터 :" + pList);
	
		// 'projcet' 테이블을 List에 담아서 컨트롤러로 보냄
		return pList;
	}

// 내 프로젝트 가져오기
@Override
public List<projectDTO> getMyProject(String id) throws Exception {
	List<projectDTO> pList = dao.getMyProject(id);
	
	System.out.println("myServiceImpl 내 프로젝트 가져오기 실행");
	
	return pList;
}

	// (4)-1 후원 취소	
	@Override
	public int deleteProject(backerDTO bDTO) throws Exception {
		
		System.out.println("마이 서비스 (4) 실행");
		
		return dao.deleteProject(bDTO);
	}
	
	// (4)-2 프로젝트 테이블 수정
	public int cancel_project(projectDTO dto) throws Exception {
		System.out.println("마이 서비스 (4) - 프로젝트 수정 실행");
		return dao.cancel_project(dto);
	}
	
	// (4)-3 리워드 테이블 수정
	public int cancel_reward(rewardDTO dto) throws Exception {
		System.out.println("마이 서비스 (4) - 리워드 수정 실행");
		return dao.cancel_reward(dto);
	}
	// 등록 취소
	/*
	 * @Override public int deleteMyProject() throws Exception {
	 * 
	 * System.out.println("myServiceImpl 내 프로젝트 삭제 실행");
	 * 
	 * return 0; }
	 */
	
	
	// (5) 카드 정보 입력
	@Override
	public int addCard(cardInfoDTO cDTO) throws DataAccessException {
		
		System.out.println("MyServiceImpl에서 받은 cardInfoDTO ==> " + cDTO);
		return dao.addCard(cDTO);

	}
	
	// (6) 계좌 정보입력
	@Override
	public int addAccount(accountInfoDTO aDTO) throws DataAccessException {
		
		System.out.println("MyServiceImpl에서 받은 accountInfoDTO ==> " + aDTO);
		return dao.addAccount(aDTO);

	}
	
	  // (7) 카드 정보 불러오기
	   @Override
	   public List<cardInfoDTO> List_CARD(String id) throws Exception {
	      

	      System.out.println("cardServiceImpl cardList() 시작");
	      return dao.List_CARD(id);
	      
	   }
	   // (8) 계좌 정보 불러오기
	   @Override
	   public List<accountInfoDTO> List_ACCOUNT(String id) throws Exception {
	      

	      System.out.println("accountServiceImpl accountList() 시작");
	      return dao.List_ACCOUNT(id);
	      
	   }
	
	// 회원 정보 수정
		@Override
		public int mymyUpdate(userinfoDTO UserinfoDTO) {
			return dao.mymyUpdate(UserinfoDTO);
		}
		
		public int updateProfile(userinfoDTO UserinfoDTO) {
			return dao.updateProfile(UserinfoDTO);
		}

		@Override
		public userinfoDTO getUserInfo(String string) {
			return dao.getUserInfo(string);
		}

		@Override
		public int deleteCard(cardInfoDTO cDTO) {
			// TODO Auto-generated method stub
			return dao.deleteCard(cDTO);
		}

		@Override
		public int deleteAccount(accountInfoDTO aDTO) {
			// TODO Auto-generated method stub
			return dao.deleteAccount(aDTO);
		}

}

