package com.fun.crpage.service;

import com.fun.crpage.dto.CrDTO;
import com.fun.crpage.dto.rewardDTO;

public interface CrService {

	//-----------------------------------------------------------------------------------------------------------
	// 프로젝트 등록 처리 
	//-----------------------------------------------------------------------------------------------------------
	public int crInsert(CrDTO crDTO) throws Exception;
	
	// 리워드 등록
	public int insertReward(rewardDTO dto);

}