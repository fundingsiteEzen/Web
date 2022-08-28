package com.fun.crpage.service;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.fun.crpage.dao.CrDAO;
import com.fun.crpage.dto.CrDTO;
import com.fun.crpage.dto.rewardDTO;


@Service
public class CrServiceImpl implements CrService {

	@Inject 
	private CrDAO crDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 프로젝트 등록 처리 
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public int crInsert(CrDTO crDTO) throws DataAccessException {
		
		System.out.println("CrServiceImpl의 crInsert() crDTO 데이터 => ==> " + crDTO);
		return crDAO.crInsert(crDTO); 

	}

	// (2) 리워드 등록
	@Override
	public int insertReward(rewardDTO dto) {
		
		int result = 1;
		for(int i = 0; i < dto.getList().size(); i++) {
			if(crDAO.insertReward(dto.getList().get(i)) <=0 )
				return result = 0;
		}
		System.out.println("crService (2) 실행");
		
		return result;
	}

}
