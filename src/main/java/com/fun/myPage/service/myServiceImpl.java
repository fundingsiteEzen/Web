package com.fun.myPage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.fun.myPage.dao.myDAO;
import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dto.projectDTO;

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
	public List<projectDTO> getProject_back(List<backerDTO> bList) throws Exception {
		
		// 가져온 테이블에서 p_seq만 뽑아서 'project' 테이블 가져오기
		List<projectDTO> pList = new ArrayList<projectDTO>(); // List 꼭 생성해줘야함.. ! null로 두면 안됨
		
			for(int i = 0; i < bList.size(); i++) {
				if(bList.get(i).getIs_like() == 'N') { // 'N'인 경우만 뽑음
					String p_seq = Integer.toString(bList.get(i).getP_seq());
					pList.add(dao.getProject_back(p_seq));
				}
			}
			System.out.println("for문 끝난 데이터 :" + pList);
		
		// 'projcet' 테이블을 List에 담아서 컨트롤러로 보냄
		return pList;
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

	// (4) 후원 취소
	@Override
	public int deleteProject(String p_seq) throws Exception {
		
		System.out.println("마이 서비스 (4) 실행");
		
		return dao.deleteProject(p_seq);
	}
	
}