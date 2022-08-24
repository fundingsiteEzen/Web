package com.fun.subPage.Controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public void projectList(Model model, HttpServletRequest req) throws Exception {
		
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
		
		// 후원 % 구하기
		int percent = (int)((double)Pdto.getP_total() / (double)Pdto.getP_goal() * 100);
		
		
		// 4. model에 붙히기
		// 남은 날짜, 프로젝트 정보, 리워드 정보, 창작자 정보
		model.addAttribute("project", Pdto);
		model.addAttribute("rewardList", r_list);
		model.addAttribute("dayCount", dayCount);
		model.addAttribute("percent", percent);
		model.addAttribute("creator", Cdto);
		
	}
	
	
	// 후원or관심 버튼 누를시 동작
	@ResponseBody
	@RequestMapping(value="/back.do", method=RequestMethod.POST)
	public String back_this(Model model, HttpServletRequest req) throws Exception {
		
		System.out.println("서브 컨트롤러(2) 실행");
		
		// 해당 프로젝트의 p_seq값 받아옴
		String p_seq = req.getParameter("p_seq");
		
		// 세션으로 아이디 값 가져오기
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("userID");
		
		// 'Y'는 등록 성공 'D'는 중복 있음 'N'은 에러 'F'는 로그인 안됨
		String result = null;
		
		// 로그인 여부 확인
		if(session.getAttribute("isLogin") != null) {
			
			backerDTO dto = new backerDTO();
			dto.setId(id);
			dto.setP_seq(Integer.parseInt(p_seq));
			dto.setIs_like(req.getParameter("is_like").charAt(0));
			
			// 중복 검사. 유저가 해당 프로젝트를 후원했는지 여부를 검사함. mapper에 보낼때 매개변수 두 개 이상 보내려면 객체로 보내야함 !
			if(sService.check_back(dto) == 0) { // 중복 값이 없는 경우
				// DB에 등록이 성공한 경우
				if(sService.back_this(dto) == 1) {
					System.out.println("등록성공");
					result = "Y";
				} // 등록에 실패한 경우
				else {
					System.out.println("등록실패");
					result = "N";
				}
			} else { 
				System.out.println("중복");
				result="D"; } // 중복 값이 있는 경우
			
		} else { result="F"; }
		
		return result;
	}
	
	// 후원 완료 한 후 마이페이지로 이동하기

	
}
