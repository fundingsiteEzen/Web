package com.fun.login.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fun.login.service.logService;
import com.fun.subPage.dto.userinfoDTO;

@Controller
public class logController {
	
	// 멤버객체
//	@Autowired
//	private userinfoDTO dto;
//	@Autowired
//	private logService lService;

	
	// 0. 로그인 화면으로 이동
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginHome() throws Exception {
		System.out.println("로그인 컨트롤러");
		return "login/login";
	}
	
	// 0. 회원가입 화면으로 이동
	@RequestMapping(value="register.do", method=RequestMethod.GET)
	public String registerHome() throws Exception {
		System.out.println("로그 컨트롤러.회원가입");
		return "login/register";
	}
	
	// ~~ 학원에서 배운 방법 ~~
	// 1. 로그인 처리
	// 정보 대조를 위해 아이디, 비밀번호를 뷰에서 받아옴. dto로 받고 dto를 통째로 서비스쪽으로 넘겨줌
//	@RequestMapping(value="/idsearch", method=RequestMethod.POST)
//	public ModelAndView searchID(@ModelAttribute("userinfo") userinfoDTO userinfo, RedirectAttributes rAttr, HttpServletRequest req,
//			HttpServletResponse res) throws Exception {
//		
//		ModelAndView mav = new ModelAndView();
//		System.out.println("브라우저에서 입력받은 아이디 : " + userinfo.getId());
//		System.out.println("브라우저에서 입력받은 비번 : " + userinfo.getPass());
//		
//		return null;
//	}
}
