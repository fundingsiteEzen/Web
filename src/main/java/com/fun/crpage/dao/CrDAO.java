package com.fun.crpage.dao;

import com.fun.crpage.dto.CrDTO;
import com.fun.crpage.dto.rewardDTO;

public interface CrDAO {

	//-----------------------------------------------------------------------------------------------------------
	// 프로젝트 등록 처리 
	//-----------------------------------------------------------------------------------------------------------
	public int crInsert(CrDTO crDTO);
	
	// 리워드 등록
	public int insertReward(rewardDTO dto);
}