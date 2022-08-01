package com.fun.subPage.dto;

public class creatorDTO {

	private String id; // user아이디
	private String c_name; // 창작자 이름
	private String c_content; // 소개글
	private String c_bank; // 계좌번호
	
	
	// get/set 메서드
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_bank() {
		return c_bank;
	}
	public void setC_bank(String c_bank) {
		this.c_bank = c_bank;
	}
	
	
	// toString
	@Override
	public String toString() {
		return "creatorDTO [id=" + id + ", c_name=" + c_name + ", c_content=" + c_content + ", c_bank=" + c_bank + "]";
	}
	
}
