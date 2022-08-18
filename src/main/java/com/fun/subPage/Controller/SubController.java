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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fun.myPage.dto.backerDTO;
import com.fun.subPage.dto.creatorDTO;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.service.subService;

@Controller
@RequestMapping(value="/subPage")
public class SubController {
	
	@Inject
	subService sService;

	
	// main에서 상세페이지로 이동
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void projectList(Model model,  HttpServletRequest req) throws Exception {
		
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
	
	
	// 후원하기 버튼 누를시 동작
	@ResponseBody
	@RequestMapping(value="/back.do", method=RequestMethod.POST)
	public String back_this(Model model, HttpServletRequest req) throws Exception {
		
		System.out.println("서브 컨트롤러(2) 실행");
		String p_seq = req.getParameter("p_seq");
		
		String result = null; // 'Y'는 등록 성공 'D'는 중복 있음 'N'은 에러
		
		// 중복 검사. 유저가 해당 프로젝트를 후원했는지 여부를 검사함
//		if(sService.check_back("user1", req.getParameter("is_like")) == null) { // !!!!! 아이디 임시고정
			backerDTO dto = new backerDTO();
			dto.setId("user1"); // !!!!! 아이디 임시로 고정해둠
			dto.setP_seq(Integer.parseInt(p_seq));
			dto.setIs_like(req.getParameter("is_like").charAt(0));
			// DB에 등록이 성공한 경우
			if(sService.back_this(dto) == 1) {
				result = "Y";
			} // 등록에 실패한 경우
			else {
				result = "N";
			}
//		} else { result="D"; } // 중복 값이 있는 경우
		
		return result;
	}
	
	// 후원 완료 한 후 마이페이지로 이동하기

	
}
