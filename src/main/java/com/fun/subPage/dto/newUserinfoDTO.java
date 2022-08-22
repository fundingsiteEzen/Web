package com.fun.subPage.dto;

public class newUserinfoDTO {

	private String id;
	private String pass;
	private String name;
	private String email;
	private String user_auth;
	
	
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
	public String getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}
	

	// toString
	@Override
	public String toString() {
		return "newUserinfoDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", email=" + email + ", user_auth="
				+ user_auth + "]";
	}
	
}
