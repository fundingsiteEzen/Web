package com.fun.category.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.edu.board.dao.BoardDAO;
import com.edu.board.dto.BoardDTO;
import com.fun.category.dao.CategoryDAO;
import com.fun.category.dto.CategoryDTO;

@Service
public interface CategoryServiceImpl extends CategoryService {
	
	@Inject
	private CategoryDAO CategoryDAO;
	
	//-----------------------------------------------------------------------------------------------------------
	// 봄 카테고리 게시글 목록
	//-----------------------------------------------------------------------------------------------------------

	@Override
	public List<CategoryDTO> categoryList() throws Exception {

		System.out.println("CategoryServiceImpl categoryList() 시작");
		return CctegoryDAO.boardList();
		
	}
} // End -public interface CategoryServiceImpl extends CategoryService
