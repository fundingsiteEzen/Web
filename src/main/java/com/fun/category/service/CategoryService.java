package com.fun.category.service;

import java.util.List;

import com.fun.category.dto.CategoryDTO;


public interface CategoryService {

	//-----------------------------------------------------------------------------------------------------------
	// 봄 카테고리 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	public List<CategoryDTO> categoryList() throws Exception;

} // End - public interface CategoryService
