package com.fun.myPage.dto;

public class cardInfoDTO {
	private String id;
	private int ci_num1;
	private int ci_num2;
	private int ci_num3;
	private int ci_num4;
	
	
	// get/set 메서드
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getci_num1() {
		return ci_num1;
	}
	public void setci_num1(int ci_num1) {
		this.ci_num1 = ci_num1;
	}
	public int getci_num2() {
		return ci_num2;
	}
	public void setci_num2(int ci_num2) {
		this.ci_num2 = ci_num2;
	}
	public int getci_num3() {
		return ci_num3;
	}
	public void setci_num3(int ci_num3) {
		this.ci_num3 = ci_num3;
	}
	public int getci_num4() {
		return ci_num4;
	}
	public void setci_num4(int ci_num4) {
		this.ci_num4 = ci_num4;
	}
	

	
	// toString
	@Override
	public String toString() {
		return "cardInfoDTO [id=" + id + ", ci_num1=" + ci_num1 + ", ci_num2=" + ci_num2 + ", ci_num3=" + ci_num3 + ", ci_num4=" + ci_num4 + ", ]";
	}
}
