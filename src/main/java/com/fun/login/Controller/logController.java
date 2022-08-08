package com.fun.login.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class logController {

	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginHome() throws Exception {
		System.out.println("로그인 컨트롤러");
		return "login/login";
	}
	
}
