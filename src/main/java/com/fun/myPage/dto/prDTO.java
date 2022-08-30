package com.fun.myPage.dto;

import java.util.List;

import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

public class prDTO {

	private List<projectDTO> pList;
	private List<rewardDTO> rList;
	
	// get/set 메서드
	
	public List<projectDTO> getpList() {
		return pList;
	}
	public void setpList(List<projectDTO> pList) {
		this.pList = pList;
	}
	public List<rewardDTO> getrDTO() {
		return rList;
	}
	public void setrDTO(List<rewardDTO> rList) {
		this.rList = rList;
	}
	
	
	
}
