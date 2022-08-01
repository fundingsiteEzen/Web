package com.fun.subPage.dto;

public class userinfoDTO {
	
	private String id; // user 아이디
	private String pass; // 비밀번호
	private String name; // 닉네임
	private String email; // 이메일

	
	// get/set 메서드
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
	
	
	// toString
	@Override
	public String toString() {
		return "userinfoDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", email=" + email + "]";
	}
	
}
