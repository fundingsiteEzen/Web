package com.fun.subPage.Controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fun.subPage.dto.creatorDTO;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.service.subService;

@Controller
@RequestMapping(value="/subPage")
public class SubController {
	
	@Inject
	subService sService;

	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void projectList(Model model,  HttpServletRequest req) throws Exception {
		
		System.out.println("서브 컨트롤러 (1) 실행 ");
		
		// 1. project 테이블 가져오기
		// 이전화면에서 p_seq 값을 받아옴
		String p_seq = req.getParameter("p_seq");
		
		System.out.println("메인에서 받아온 파람값 : " + p_seq);
		projectDTO Pdto = sService.projectList(p_seq);
		
		System.out.println("Pdto 가져온 데이터 : " + Pdto);
		
		// 2. reward 테이블 가져오기
		List<projectDTO> r_list = sService.rewardList(p_seq);
		System.out.println("리워드 리스트 가져온 데이터 : " + r_list);
		
		// 3. creator 테이블 가져오기
		// 1에서 가져온 테이블에서 id를 넘김
		creatorDTO Cdto = sService.creatorList(Pdto.getId());
		System.out.println("Cdto 가져온 데이터 : " + Cdto);
		
		
		// 남은 날짜 구하기
		Date end = Pdto.getP_endDate();
		Calendar todayCal = Calendar.getInstance();
		Calendar eCal = Calendar.getInstance();
		
		todayCal.setTime(new Date(System.currentTimeMillis())); // 현재시간을 담음
		eCal.setTime(end); // 종료시간을 담음
		
		long sec = (eCal.getTimeInMillis() - todayCal.getTimeInMillis()) / 1000;
		long dayCount = sec / (24*60*60);
		
		// 총 후원 금액 구하기
		
		
		// 4. model에 붙히기
		// 남은 날짜, 프로젝트 정보, 리워드 정보, 창작자 정보
		model.addAttribute("project", Pdto);
		model.addAttribute("rewardList", r_list);
		model.addAttribute("dayCount", dayCount);
		model.addAttribute("creator", Cdto);
		
	}
	
}
