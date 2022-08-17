package com.fun.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fun.category.dto.CategoryDTO;
import com.fun.category.service.CategoryService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private CategoryService categoryService;
	
	//-----------------------------------------------------------------------------------------------------------
	// @RequestMapping(value = "/", method = RequestMethod.GET)
	//-----------------------------------------------------------------------------------------------------------
	//-----------------------------------------------------------------------------------------------------------
	// 메인 화면 불러오기
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		
		System.out.println("CategoryController SpringList() 시작");
		
		List<CategoryDTO> SpringList = categoryService.SpringList();
		List<CategoryDTO> SummerList = categoryService.SummerList();
		List<CategoryDTO> AutumnList = categoryService.AutumnList();
		List<CategoryDTO> WinterList = categoryService.WinterList();
		
		model.addAttribute("SpringList", SpringList);
		model.addAttribute("SummerList", SummerList);
		model.addAttribute("AutumnList", AutumnList);
		model.addAttribute("WinterList", WinterList);
		
		return "main";
	}
	//-----------------------------------------------------------------------------------------------------------
	// 실시간 베스트 무비 불러오기(SELETE * FROM project ORDER BY seq asc 정렬)
	//-----------------------------------------------------------------------------------------------------------

	//-----------------------------------------------------------------------------------------------------------
	// 새로운 무비 불러오기 (SELETE * FROM project ORDER BY seq asc 정렬)
	//-----------------------------------------------------------------------------------------------------------

	
} // End - public class HomeController