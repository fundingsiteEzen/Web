package com.fun.myPage.dto;

import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class userinfoDTO {

	private String id;	//아이디
	private String pass;		// 비밀번호
	private String name;		// 이름
	private String email;		// 이메일
	private String address;		// 주소
	private String profile_img; // 프로필 이미지
	private String user_auth;   // 계정 권한
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}
	
	public void setUserInfo(Map<String, String> map) {
		for(String key : map.keySet()) {
			switch (key) {
			case "id":
				this.setId(map.get(key));
				break;
			case "pass":
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				this.setPass(passwordEncoder.encode(map.get(key)));
				break;
			case "name":
				this.setName(map.get(key));
				break;
			case "address":
				this.setAddress(map.get(key));
				break;
			case "profile_img":
				this.setProfile_img(map.get(key));
				break;
			case "email":
				this.setEmail(map.get(key));
				break;
			default:
				break;
			}
		}
	}
}
