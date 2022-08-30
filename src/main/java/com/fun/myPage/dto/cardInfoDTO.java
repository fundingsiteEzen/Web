package com.fun.myPage.dto;

public class cardInfoDTO {
	private int ci_seq;
	private String id;			// 유저 아이디
	private String ci_num1;		// 카드 번호 1~4
	private String ci_num2;		// 카드 번호 5~8
	private String ci_num3;		// 카드 번호 9~12
	private String ci_num4;		// 카드 번호 13~16
	private String ci_month;	// 카드 유효기간 월
	private String ci_year;		// 카드 유효기간 년
	private String ci_pass;		// 카드 비밀번호
	private String ci_birth;	// 소유주 생년월일
	
	
	// get/set 메서드
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getci_num1() {
		return ci_num1;
	}
	public void setci_num1(String ci_num1) {
		this.ci_num1 = ci_num1;
	}
	public String getci_num2() {
		return ci_num2;
	}
	public void setci_num2(String ci_num2) {
		this.ci_num2 = ci_num2;
	}
	public String getci_num3() {
		return ci_num3;
	}
	public void setci_num3(String ci_num3) {
		this.ci_num3 = ci_num3;
	}
	public String getci_num4() {
		return ci_num4;
	}
	public void setci_num4(String ci_num4) {
		this.ci_num4 = ci_num4;
	}
	public String getci_month() {
		return ci_month;
	}
	public void setci_month(String ci_month) {
		this.ci_month = ci_month;
	}
	public String getci_year() {
		return ci_year;
	}
	public void setci_year(String ci_year) {
		this.ci_year = ci_year;
	}
	public String getci_pass() {
		return ci_pass;
	}
	public void setci_pass(String ci_pass) {
		this.ci_pass = ci_pass;
	}
	public String getci_birth() {
		return ci_birth;
	}
	public void setci_birth(String ci_birth) {
		this.ci_birth = ci_birth;
	}
	public int getCi_seq() {
		return ci_seq;
	}
	public void setCi_seq(int ci_seq) {
		this.ci_seq = ci_seq;
	}
}
