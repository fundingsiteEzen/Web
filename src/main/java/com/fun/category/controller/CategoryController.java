package com.fun.category.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@Inject
	private CategoryService categoryService;
	//------------------------------------------------------------------------------------------------------------
	// 봄 카테고리 목록
	//------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/SpringList", method = RequestMethod.GET)
	public void SpringList(Locale locale, Model model) throws Exception {
		
		System.out.println("CategoryController SpringList() 시작");
		
		List<CategoryDTO> SpringList = categoryService.SpringList();
		model.addAttribute("SpringList", SpringList);	
	}
	
	//------------------------------------------------------------------------------------------------------------
	// 여름 카테고리
	//------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/SummerList", method = RequestMethod.GET)
	public void SummerList(Locale locale, Model model) throws Exception {
		
		System.out.println("CategoryController SummerList() 시작");
		
		List<CategoryDTO> SummerList = categoryService.SummerList();
		model.addAttribute("SummerList", SummerList);
	}
	
	//------------------------------------------------------------------------------------------------------------
	// 가을 카테고리
	//------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/AutumnList", method = RequestMethod.GET)
	public void AutumnList(Locale locale, Model model) throws Exception {
		
		System.out.println("CategoryController AutumnList() 시작");
		
		List<CategoryDTO> AutumnList = categoryService.AutumnList();
		model.addAttribute("AutumnList", AutumnList);
	}
	
	//------------------------------------------------------------------------------------------------------------
	// 겨울 카테고리
	//------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/WinterList", method = RequestMethod.GET)
	public void WinterList(Locale locale, Model model) throws Exception {
		
		System.out.println("CategoryController WinterList() 시작");
		
		List<CategoryDTO> WinterList = categoryService.WinterList();
		model.addAttribute("WinterList", WinterList);
	}
} // End - public class CategoryController
