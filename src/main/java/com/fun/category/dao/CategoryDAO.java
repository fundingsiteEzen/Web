package com.fun.category.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.fun.category.dto.CategoryDTO;
import com.fun.subPage.dto.projectDTO;

//------------------------------------------------------------------------------------------------------------
// public interface CategoryDAO
//------------------------------------------------------------------------------------------------------------

public interface CategoryDAO {

	//------------------------------------------------------------------------------------------------------------
	// 봄 카테고리 목록 띄우기
	//------------------------------------------------------------------------------------------------------------
	public List<CategoryDTO> categoryList() throws Exception;
	
} // End - public interface CategoryDAO
