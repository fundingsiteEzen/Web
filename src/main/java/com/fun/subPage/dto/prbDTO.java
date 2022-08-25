package com.fun.subPage.dto;

public class prbDTO {

	// 리워드 dto의 정보
	private int p_seq;
	private int r_seq;
	private int r_price;
	private int r_count;
	// backer dto의 정보
	private int r_addMoney;
	
	
	// get/set 메서드
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
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	public int getR_count() {
		return r_count;
	}
	public void setR_count(int r_count) {
		this.r_count = r_count;
	}
	public int getR_addMoney() {
		return r_addMoney;
	}
	public void setR_addMoney(int r_addMoney) {
		this.r_addMoney = r_addMoney;
	}

	
	// toString
	@Override
	public String toString() {
		return "prbDTO [p_seq=" + p_seq + ", r_seq=" + r_seq + ", r_price=" + r_price + ", r_count=" + r_count
				+ ", r_addMoney=" + r_addMoney + "]";
	}
	
}
