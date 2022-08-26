package com.fun.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fun.login.dao.logDAO;
import com.fun.subPage.dto.newUserinfoDTO;
import com.fun.subPage.dto.userinfoDTO;

@Service
public class logService implements logServiceIfc {
	
	@Autowired
	private logDAO dao;

	
	// 아이디는 dao쪽으로 넘겨주고, 값이 있다면 비밀번호와 대조.
	// 비밀번호가 일치하면 컨트롤러로 값 넘겨주고, 아니면 다른거 넘겨줌 -- 차후 수정. 현재는 dto전부 넘겨줌
	public userinfoDTO login(userinfoDTO userinfo) throws Exception {
		
		return dao.searchID(userinfo.getId());
	}

	// (3) 회원가입
	public int addMember(newUserinfoDTO userinfo) throws Exception {
		System.out.println("회원가입 service(3)");
		return dao.addMember(userinfo);
	}
	
	
	public int checkId(String id) throws Exception {
		return dao.checkID(id);
	}

}
