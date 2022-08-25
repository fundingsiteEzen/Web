package com.fun.myPage.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fun.myPage.dto.backerDTO;
import com.fun.myPage.dto.cardInfoDTO;
import com.fun.myPage.service.mySerivce;
import com.fun.subPage.dto.projectDTO;

@Controller
@RequestMapping(value="/myPage")
public class MyController {
	
	@Autowired
	mySerivce mService;
	
	
	// 마이페이지로 이동
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public void mypage(Model model, HttpServletRequest req) throws Exception {
		
		System.out.println("마이 컨트롤러(1) 실행");
		
		// 아이디로 정보 가져오기
		// 세션으로 아이디 값 가져오기
//		HttpSession session = req.getSession();
//		String id = (String)session.getAttribute("userID");
		String id = "user1";
		List<backerDTO> bDTO = mService.getBacker(id);
		
		// 후원목록 / 관심목록 나누기
		List<projectDTO> project_BACK = mService.getProject_back(bDTO);
		List<projectDTO> project_LIKE = mService.getProject_Like(bDTO);
		
		// model에 붙혀서 전달
		model.addAttribute("backList", project_BACK);
		model.addAttribute("likeList", project_LIKE);
		
	}
	
	// 회원정보 수정화면으로 이동
	@RequestMapping(value="/mymy", method=RequestMethod.GET)
	public void projectList(Model model) throws Exception {
	}
	
	// 후원 & 관심 목록 삭제
	@ResponseBody
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String deleteProject(Model model, HttpServletRequest req, backerDTO bDTO) throws Exception {
		
		System.out.println("마이페이지에서 받아온 is_like 값 : " + bDTO.getIs_like() + ", p_Seq값 : " + bDTO.getP_seq());
		// 아이디는 세션에서 받아옴
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("userID");
		bDTO.setId(id);
		
		String result = null;
		if(mService.deleteProject(bDTO) <= 1) { // 삭제가 성공한 경우
			System.out.println("삭제성공");
			result = "Y";
		} // 삭제에 실패한 경우
		else {
			System.out.println("삭제실패");
			result = "N";
		}
		
		return result;
	}
	
	// 카드 정보 입력
	
	@RequestMapping(value="/addCard.do", method=RequestMethod.POST)
	public ModelAndView addCard(@ModelAttribute("cardInfoDTO") cardInfoDTO cDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("MyController에서 받은 cardInfoDTO ==> " + cDTO);
		
		String id = "user1";
		cDTO.setId(id);
		
		int result = 0;
		// 사용자가 입력한 정보를 서비스에게 넘겨주어 처리하게 한다.
		result = mService.addCard(cDTO);

		ModelAndView mav	= new ModelAndView();
		mav.setViewName("/myPage/mymy");
		return mav;
}
}





