package com.fun.crpage.dto;

import java.util.List;

public class rewardDTO {
	
	private String id; // user아이디
	private String p_seq; // 프로젝트 고유번호
	private String r_seq; // 리워드 고유번호
	private int r_price; // 리워드 가격
	private String r_content; // 리워드 소개
	private int addMoney; // 추가후원금
	private int r_count; // 준비수량
	private List<rewardDTO> list;
	
	
	// get/set 메서드
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getP_seq() {
		return p_seq;
	}
	public void setP_seq(String p_seq) {
		this.p_seq = p_seq;
	}
	public String getR_seq() {
		return r_seq;
	}
	public void setR_seq(String r_seq) {
		this.r_seq = r_seq;
	}
	public int getR_price() {
		return r_price;
	}
	public void setR_price(int r_price) {
		this.r_price = r_price;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public int getAddMoney() {
		return addMoney;
	}
	public void setAddMoney(int addMoney) {
		this.addMoney = addMoney;
	}
	public int getR_count() {
		return r_count;
	}
	public void setR_count(int r_count) {
		this.r_count = r_count;
	}
	
	public void setList(List<rewardDTO> list) {
		this.list = list;
	}
	public List<rewardDTO> getList() {
		return this.list;
	}
	
	
	// toString
	@Override
	public String toString() {
		return "rewardDTO [id=" + id + ", p_seq=" + p_seq + ", r_seq=" + r_seq + ", r_price=" + r_price + ", content="
				+ r_content + ", addMoney=" + addMoney + ", r_count=" + r_count + "]";
	}

}
