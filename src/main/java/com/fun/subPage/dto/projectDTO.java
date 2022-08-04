package com.fun.subPage.dto;

import java.sql.Date;

public class projectDTO {

	private String id; // user아이디
	private String p_seq; // 프로젝트 고유번호
	private String p_name; // 프로젝트 이름
	private Date p_beginDate; // 펀딩 시작일
	private Date p_endDate; // 펀딩 종료일
	private Date p_payDate; // 결제 예정일
	private String content; // 프로젝트 소개
	private char p_ing; // 'Y' : 펀딩중, 'N' : 펀딩 종료
	private int p_backer; // 총 후원 인원
	private long p_goal; // 목표 금액
	
	
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public Date getP_beginDate() {
		return p_beginDate;
	}
	public void setP_beginDate(Date p_beginDate) {
		this.p_beginDate = p_beginDate;
	}
	public Date getP_endDate() {
		return p_endDate;
	}
	public void setP_endDate(Date p_endDate) {
		this.p_endDate = p_endDate;
	}
	public Date getP_payDate() {
		return p_payDate;
	}
	public void setP_payDate(Date p_payDate) {
		this.p_payDate = p_payDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public char getP_ing() {
		return p_ing;
	}
	public void setP_ing(char p_ing) {
		this.p_ing = p_ing;
	}
	public int getP_backer() {
		return p_backer;
	}
	public void setP_backer(int p_backer) {
		this.p_backer = p_backer;
	}
	public long getP_goal() {
		return p_goal;
	}
	public void setP_goal(long p_goal) {
		this.p_goal = p_goal;
	}
	
	
	// toString
	@Override
	public String toString() {
		return "projectDTO [id=" + id + ", p_seq=" + p_seq + ", p_name=" + p_name + ", p_beginDate=" + p_beginDate
				+ ", p_endDate=" + p_endDate + ", p_payDate=" + p_payDate + ", content=" + content + ", p_ing=" + p_ing
				+ ", p_backer=" + p_backer + ", p_goal=" + p_goal + "]";
	}
	
}
