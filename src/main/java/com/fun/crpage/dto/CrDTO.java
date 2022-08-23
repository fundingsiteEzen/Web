package com.fun.crpage.dto;

import java.sql.Date;

public class CrDTO {

	private String 	id; 			// user아이디
	private int 	p_seq; 			// 프로젝트 고유번호
	private String 	p_name; 		// 프로젝트 이름
	private String 	p_category;		// 프로젝트 카테고리
	private Date 	p_beginDate; 	// 펀딩 시작일
	private Date 	p_endDate; 		// 펀딩 종료일
	private Date 	p_payDate; 		// 결제 예정일
	private String 	p_content; 		// 프로젝트 소개
	private char 	p_ing; 			// 'Y' : 펀딩중, 'N' : 펀딩 종료
	private int 	p_backer; 		// 총 후원 인원
	private long 	p_goal; 		// 목표 금액
	private String 	p_thumnail_img;	// 썸네일 이미지
	private String 	p_Sub_img1;		// 상세페이지 이미지1
	private String 	p_Sub_img2;		// 상세페이지 이미지2
	private String 	p_Sub_img3;		// 상세페이지 이미지3
	
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
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
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
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
	public String getP_thumnail_img() {
		return p_thumnail_img;
	}
	public void setP_thumnail_img(String p_thumnail_img) {
		this.p_thumnail_img = p_thumnail_img;
	}
	public String getP_Sub_img1() {
		return p_Sub_img1;
	}
	public void setP_Sub_img1(String p_Sub_img1) {
		this.p_Sub_img1 = p_Sub_img1;
	}
	public String getP_Sub_img2() {
		return p_Sub_img2;
	}
	public void setP_Sub_img2(String p_Sub_img2) {
		this.p_Sub_img2 = p_Sub_img2;
	}
	public String getP_Sub_img3() {
		return p_Sub_img3;
	}
	public void setP_Sub_img3(String p_Sub_img3) {
		this.p_Sub_img3 = p_Sub_img3;
	}
	
	@Override
	public String toString() {
		return "CategoryDTO [id=" + id + ", p_seq=" + p_seq + ", p_name=" + p_name + ", p_category=" + p_category
				+ ", p_beginDate=" + p_beginDate + ", p_endDate=" + p_endDate + ", p_payDate=" + p_payDate
				+ ", p_content=" + p_content + ", p_ing=" + p_ing + ", p_backer=" + p_backer + ", p_goal=" + p_goal
				+ ", p_thumnail_img=" + p_thumnail_img + ", p_Sub_img1=" + p_Sub_img1 + ", p_Sub_img2=" + p_Sub_img2
				+ ", p_Sub_img3=" + p_Sub_img3 + "]";
	}
}