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
	
	// ------------------------------------------------------------------------------------------------------------
	// 여름 카테고리 목록 띄우기
	// ------------------------------------------------------------------------------------------------------------
	@Override
	public List<CategoryDTO> SummerList() throws Exception {

		System.out.println("CategoryDAOImpl SummerList() 시작");
		
		List<CategoryDTO> SummerList = sqlSession.selectList(namespace + ".summer_categoryList");
		
		System.out.println("CategoryDAOImpl SummerList() Data ==> " + SummerList);
		
		return SummerList;	
	}
	
	// ------------------------------------------------------------------------------------------------------------
	// 가을 카테고리 목록 띄우기
	// ------------------------------------------------------------------------------------------------------------
	@Override
	public List<CategoryDTO> AutumnList() throws Exception {

		System.out.println("CategoryDAOImpl AutumnList() 시작");
		
		List<CategoryDTO> AutumnList = sqlSession.selectList(namespace + ".autumn_categoryList");
		
		System.out.println("CategoryDAOImpl AutumnList() Data ==> " + AutumnList);
		
		return AutumnList;	
	}
	
	// ------------------------------------------------------------------------------------------------------------
	// 겨울 카테고리 목록 띄우기
	// ------------------------------------------------------------------------------------------------------------
	@Override
	public List<CategoryDTO> WinterList() throws Exception {

		System.out.println("CategoryDAOImpl WinterList() 시작");
		
		List<CategoryDTO> WinterList = sqlSession.selectList(namespace + ".winter_categoryList");
		
		System.out.println("CategoryDAOImpl WinterList() Data ==> " + WinterList);
		
		return WinterList;	
	}
} // End - public class CategoryDAOImpl implements CategoryDAO
