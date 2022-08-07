package com.fun.category.service;

import java.util.List;

import com.fun.category.dto.CategoryDTO;

//------------------------------------------------------------------------------------------------------------
// public interface CategoryService
//------------------------------------------------------------------------------------------------------------

public interface CategoryService {

	//-----------------------------------------------------------------------------------------------------------
	// 봄 카테고리 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	public List<CategoryDTO> SpringList() throws Exception;
	
} // End - public interface CategoryService
