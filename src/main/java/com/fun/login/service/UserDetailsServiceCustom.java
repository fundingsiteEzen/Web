package com.fun.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fun.login.dao.UserDAO;
import com.fun.login.vo.userDetailsVO;
import com.fun.subPage.dto.newUserinfoDTO;

@Service("userDetailsServiceCustom")
public class UserDetailsServiceCustom implements UserDetailsService {

	@Autowired
	private UserDAO dao;
	
	// 로그인
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		// 최종적으로 시큐쪽으로 보낼 객체
		userDetailsVO resultVO = new userDetailsVO();
		
		// DB에서 사용자 정보를 가져옴.
		// DB에서 받아올때는 userinfoDTO로 받고 그 정보를 VO에 담아서 시큐로 보냄 !
		try {
			System.out.println("User 서비스 객체");
			newUserinfoDTO dto = dao.selectUserInfo(id);
			if(dto == null) {
				System.out.println("id 정보 없음");
				return null;
			} else {
				resultVO.setUsername(dto.getId());
				resultVO.setUsername(dto.getPass());
				System.out.println("id 정보 있음");
			}
			System.out.println(dto.getEmail());
		} catch (Exception e) {
			System.out.println("오류");
			e.printStackTrace();
		}
		
		return resultVO;
	}
	
	// 회원가입
	public int register(newUserinfoDTO userinfo) throws Exception {
		System.out.println("회원가입 service");
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		userinfo.setPass(passwordEncoder.encode(userinfo.getPass())); // 비밀번호 암호화
		userinfo.setName("테스트닉네임");
		userinfo.setUser_auth("USER"); // 권한 설정
		System.out.println("입력받은 아이디 : " + userinfo);
		System.out.println("DAO:" + dao);
		
		return dao.register(userinfo);
	}
}
