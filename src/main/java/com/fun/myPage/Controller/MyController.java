package com.fun.myPage.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fun.myPage.dto.backerDTO;
import com.fun.myPage.service.mySerivce;
import com.fun.subPage.dto.projectDTO;

@Controller
@RequestMapping(value="/myPage")
public class MyController {
	
	@Autowired
	mySerivce mService;
	
	
	// 마이페이지로 이동
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public void mypage(Model model) throws Exception {
		
		System.out.println("마이 컨트롤러(1) 실행");
		
		// 아이디로 정보 가져오기
		String id = "user1"; // 임의로 고정해놓음
		List<backerDTO> bDTO = mService.getBacker(id);
		
		// 후원목록 / 관심목록 나누기
		List<projectDTO> project_BACK = mService.getProject_back(bDTO);
		List<projectDTO> project_LIKE = mService.getProject_Like(bDTO);
		
		// model에 붙혀서 전달
		model.addAttribute("backList", project_BACK);
		model.addAttribute("likeList", project_LIKE);
		
	}
	
	// 회원정보 수정화면으로 이동
	@RequestMapping(value="/myInfo", method=RequestMethod.GET)
	public void projectList(Model model) throws Exception {
	}
	
}