package com.fun.myPage.dto;

public class accountInfoDTO {
	private String id;			// 유저 아이디
	private String ai_bank;		// 결제 은행
	private String ai_num;		// 계좌 번호
	private String ai_name;		// 예금주 이름
	
	
	// get/set 메서드
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getai_bank() {
		return ai_bank;
	}
	public void setai_bank(String ai_bank) {
		this.ai_bank = ai_bank;
	}
	public String getai_num() {
		return ai_num;
	}
	public void setai_num(String ai_num) {
		this.ai_num = ai_num;
	}
	public String getai_name() {
		return ai_name;
	}
	public void setai_name(String ai_name) {
		this.ai_name = ai_name;
	}


	
	// toString
	@Override
	public String toString() {
		return "accountInfoDTO [id=" + id + ", ai_bank=" + ai_bank + ", ai_num=" + ai_num + ", ai_name=" + ai_name + "]";
	}
}
