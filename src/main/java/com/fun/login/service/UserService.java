package com.fun.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.fun.login.dao.UserDAO;
import com.fun.login.vo.userDetailsVO;
import com.fun.subPage.dto.userinfoDTO;

@Service
public class UserService implements UserDetailsService {

	@Autowired
	private UserDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		// 최종적으로 시큐쪽으로 보낼 객체
		userDetailsVO resultVO = new userDetailsVO();
		
		// DB에서 사용자 정보를 가져옴.
		// DB에서 받아올때는 userinfoDTO로 받고 그 정보를 VO에 담아서 시큐로 보냄 !
		try {
			userinfoDTO dto = dao.selectUserInfo(username);
			if(dto == null) {
				return null;
			} else {
				resultVO.setUsername(dto.getId());
				resultVO.setUsername(dto.getPass());
			}
			System.out.println(dto.getEmail());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultVO;
	}
	
}
