package com.fun.category.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.fun.category.dto.CategoryDTO;
import com.fun.category.service.CategoryService;


//------------------------------------------------------------------------------------------------------------
//카테고리
//------------------------------------------------------------------------------------------------------------
@Controller	// Bean의 대상으로 인식시키기 위해서 servlet-context.xml에 등록한다.
@RequestMapping(value = "/category/*")
public class CategoryController {


	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	//------------------------------------------------------------------------------------------------------------
	// 봄 카테고리
	//------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/SpringList", method = RequestMethod.POST)
	public void boardList(Locale locale, Model model) throws Exception {
		
		System.out.println("BoardController boardList() 시작");
		
		List<CategoryDTO> categoryList = CategoryService.categoryList;
		System.out.println("CategoryController categoryList() 데이터 ==> " + categoryList);
		model.addAttribute("categoryList", categoryList);
		
	}

	
	//------------------------------------------------------------------------------------------------------------
	// 여름 카테고리
	//------------------------------------------------------------------------------------------------------------

	//------------------------------------------------------------------------------------------------------------
	// 가을 카테고리
	//------------------------------------------------------------------------------------------------------------

	//------------------------------------------------------------------------------------------------------------
	// 겨울 카테고리
	//------------------------------------------------------------------------------------------------------------

} // End - public class CategoryController
