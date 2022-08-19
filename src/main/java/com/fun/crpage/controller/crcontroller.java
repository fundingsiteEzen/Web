package com.fun.crpage.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fun.crpage.dto.CrDTO;
import com.fun.crpage.service.CrService;


//------------------------------------------------------------------------------------------------------------
// crpage 컨트롤러
//------------------------------------------------------------------------------------------------------------
@Controller
@RequestMapping(value = "/crpage")
public class crcontroller {

	@Inject 
	private CrService crService;
	
	@RequestMapping(value = "/cr", method = RequestMethod.GET)
	public void crGET() {
		
		System.out.println("crController의 crGET 시작");
	}

	//-----------------------------------------------------------------------------------------------------------
	// 프로젝트 등록 처리 
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/cr", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("crInsert") CrDTO crDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		System.out.println("CrController의 crInsert() crDTO 데이터 => " + crDTO);
		int result = 0;
		result = crService.crInsert(crDTO);

		ModelAndView mav = new ModelAndView("redirect:/myPage/myPage");

		return mav;
	}
}