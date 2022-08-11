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

import com.fun.login.service.UserService;
import com.fun.subPage.dto.userinfoDTO;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	
//	@RequestMapping(value="/seculogin", method=RequestMethod.GET)
//	public String seculogin() {
//		String id = "id01";
//		uService.loadUserByUsername(id);
//		return "/login/login";
//	}
	
	@RequestMapping(value="/seculogin", method=RequestMethod.POST)
	public ModelAndView seculogin(@ModelAttribute("userinfo") userinfoDTO userinfo, RedirectAttributes rAttr, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("브라우저에서 입력받은 아이디 : " + userinfo.getId());
		System.out.println("브라우저에서 입력받은 비번 : " + userinfo.getPass());
		
		String id = "id01";
		uService.loadUserByUsername(id);
		return null;
		
	}
	
	// 로그인 실패
	// 이거 value /로 해놓으면 안됨 ㅡㅡ 메인이랑 충돌남 수정 나중에 함
//	@RequestMapping(value="/", method=RequestMethod.GET)
//	public void logFailed() {}
	
}
