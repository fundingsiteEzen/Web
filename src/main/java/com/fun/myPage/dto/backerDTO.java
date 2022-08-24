package com.fun.myPage.dto;

public class backerDTO {

	private String id;
	private int p_seq;
	private int r_seq;
	private int r_addMoney;
	private char is_like;
	
	
	// get/set 메서드
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public int getR_seq() {
		return r_seq;
	}
	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}
	public int getR_addMoney() {
		return r_addMoney;
	}
	public void setR_addMoney(int r_addMoney) {
		this.r_addMoney = r_addMoney;
	}
	public char getIs_like() {
		return is_like;
	}
	public void setIs_like(char is_like) {
		this.is_like = is_like;
	}

	
	// toString
	@Override
	public String toString() {
		return "backerDTO [id=" + id + ", p_seq=" + p_seq + ", r_seq=" + r_seq + ", r_addMoney=" + r_addMoney
				+ ", is_like=" + is_like + "]";
	}
	
}
