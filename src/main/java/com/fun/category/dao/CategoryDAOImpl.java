package com.fun.category.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fun.category.dto.CategoryDTO;

//------------------------------------------------------------------------------------------------------------
// public class CategoryDAOImpl implements CategoryDAO
//------------------------------------------------------------------------------------------------------------
@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "com.fun.category";
	
	// ------------------------------------------------------------------------------------------------------------
	// 봄 카테고리 목록 띄우기
	// ------------------------------------------------------------------------------------------------------------
	@Override
	public List<CategoryDTO> SpringList() throws Exception {

		System.out.println("CategoryDAOImpl SpringList() 시작");
		
		List<CategoryDTO> SpringList = sqlSession.selectList(namespace + ".spring_categoryList");
		
		System.out.println("CategoryDAOImpl SpringList() Data ==> " + SpringList);
		
		return SpringList;
		
	}
} // End - public class CategoryDAOImpl implements CategoryDAO
