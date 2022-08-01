package com.fun.subPage.Controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.service.subService;

@Controller
@RequestMapping(value="/subPage")
public class SubController {
	
	@Inject
	subService sService;

	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void projectList(Model model) throws Exception {
		
		System.out.println("서브 컨트롤러 (1) 실행 ");
		
		// 1. project 테이블 가져오기
		String p_seq = "pro01"; // 임시로 고정해놓음
		projectDTO dto = sService.projectList(p_seq);
		
		System.out.println("가져온 데이터 : " + dto);
		
		// 2. reward 테이블 가져오기
		List<projectDTO> r_list = sService.rewardList(p_seq);
		System.out.println("가져온 데이터 : " + r_list);
		
		// 3. model에 붙히기
		model.addAttribute("rewardList", r_list);
		
	}
	
}
