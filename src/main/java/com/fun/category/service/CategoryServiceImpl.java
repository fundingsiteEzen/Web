package com.fun.category.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.fun.category.dao.CategoryDAO;
import com.fun.category.dto.CategoryDTO;

//------------------------------------------------------------------------------------------------------------
// public class CategoryServiceImpl implements CategoryService
//------------------------------------------------------------------------------------------------------------
@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Inject
	private CategoryDAO categoryDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 봄 카테고리 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<CategoryDTO> SpringList() throws Exception {

		System.out.println("CategoryServiceImpl SpringList() 시작");
		return categoryDAO.SpringList();
	}

	//-----------------------------------------------------------------------------------------------------------
	// 여름 카테고리 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<CategoryDTO> SummerList() throws Exception {

		System.out.println("CategoryServiceImpl SummerList() 시작");
		return categoryDAO.SummerList();
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 가을 카테고리 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<CategoryDTO> AutumnList() throws Exception {

		System.out.println("CategoryServiceImpl AutumnList() 시작");
		return categoryDAO.AutumnList();
	}
	
	//-----------------------------------------------------------------------------------------------------------
	// 겨울 카테고리 게시글 목록
	//-----------------------------------------------------------------------------------------------------------
	@Override
	public List<CategoryDTO> WinterList() throws Exception {

		System.out.println("CategoryServiceImpl WinterList() 시작");
		return categoryDAO.WinterList();
	}
} // End - public class CategoryServiceImpl implements CategoryService
