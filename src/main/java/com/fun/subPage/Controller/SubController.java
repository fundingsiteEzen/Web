package com.fun.subPage.Controller;

import java.sql.Date;
import java.util.Calendar;
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
		
		
		// 남은 날짜 구하기
		Date end = dto.getP_endDate();
		Calendar todayCal = Calendar.getInstance();
		Calendar eCal = Calendar.getInstance();
		
		todayCal.setTime(new Date(System.currentTimeMillis())); // 현재시간을 담음
		eCal.setTime(end); // 종료시간을 담음
		
		long sec = (eCal.getTimeInMillis() - todayCal.getTimeInMillis()) / 1000;
		long dayCount = sec / (24*60*60);
		
		// 총 후원 금액 구하기
		
		
		// 3. model에 붙히기
		// 남은 날짜, 총 후원 금액, 프로젝트 정보, 리워드 정보
		model.addAttribute("project", dto);
		model.addAttribute("rewardList", r_list);
		model.addAttribute("dayCount", dayCount);
		
	}
	
}
