package com.fun.crpage.dao;

import com.fun.crpage.dto.CrDTO;

public interface CrDAO {

	//-----------------------------------------------------------------------------------------------------------
	// 프로젝트 등록 처리 
	//-----------------------------------------------------------------------------------------------------------
	public int crInsert(CrDTO crDTO);
	
}