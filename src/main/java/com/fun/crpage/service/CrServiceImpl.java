package com.fun.crpage.service;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.fun.crpage.dao.CrDAO;
import com.fun.crpage.dto.CrDTO;


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

}
