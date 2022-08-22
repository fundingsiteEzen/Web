package com.fun.crpage.service;

import com.fun.crpage.dto.CrDTO;

public interface CrService {

	//-----------------------------------------------------------------------------------------------------------
	// 프로젝트 등록 처리 
	//-----------------------------------------------------------------------------------------------------------
	public int crInsert(CrDTO crDTO) throws Exception;

}