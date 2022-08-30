package com.fun.myPage.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fun.myPage.dto.backerDTO;
import com.fun.myPage.service.Iservice;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

@Controller
@RequestMapping(value="/myPage")
public class imsiC {
	
	@Autowired
	Iservice I;
	
//	@ResponseBody
//	@RequestMapping(value="/imsiDelete.do")
//	@Transactional
//	// 후원 & 관심 목록 삭제
//	public String deleteProject(Model model, HttpServletRequest req, backerDTO bDTO) throws Exception {
//		
//		// 아이디는 세션에서 받아옴
//		HttpSession session = req.getSession();
//		String id = (String)session.getAttribute("userID");
//		bDTO.setId(id);
//		
//		// 'Y'는 등록 성공 'D'는 중복 있음 'N'은 에러 'F'는 로그인 안됨
//		String result = null;
//		
//		// 로그인 여부 확인
//		if(session.getAttribute("isLogin") != null) {
//			
//			// 중복 검사. 유저가 해당 프로젝트를 후원했는지 여부를 검사함. mapper에 보낼때 매개변수 두 개 이상 보내려면 객체로 보내야함 !
//			projectDTO pDTO = new projectDTO();
//			rewardDTO rDTO = new rewardDTO();
//			
//			// 테이블 세개 수정함 cancel_back은 backer테이블 수정 & cancel_project는 project테이블 수정 & cancel_reward는 reward 테이블 수정
//			// DB에 등록이 성공한 경우.
//			if(I.cancel_back(bDTO) == 1 && I.cancel_project(pDTO) == 1 && I.cancel_reward(rDTO) == 1) {
//				System.out.println("등록성공");
//				result = "Y";
//			} // 등록에 실패한 경우
//			else {
//				System.out.println("등록실패");
//				result = "N";
//			}
//			
//		} else { result="F"; }
//		
//		return result;
//	}

}
