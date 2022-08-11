package com.fun.login.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fun.login.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	
	@RequestMapping(value="/seculogin", method=RequestMethod.GET)
	public String seculogin() {
		String id = "id01";
		uService.loadUserByUsername(id);
		return "/login/login";
	}
	
	// 로그인 실패
	// 이거 value /로 해놓으면 안됨 ㅡㅡ 메인이랑 충돌남 수정 나중에 함
//	@RequestMapping(value="/", method=RequestMethod.GET)
//	public void logFailed() {}
	
}
