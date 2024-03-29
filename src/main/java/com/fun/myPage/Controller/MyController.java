package com.fun.myPage.Controller;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fun.myPage.dto.accountInfoDTO;
import com.fun.myPage.dto.backerDTO;
import com.fun.myPage.dto.cardInfoDTO;
import com.fun.myPage.dto.prDTO;
import com.fun.myPage.dto.userinfoDTO;
import com.fun.myPage.service.mySerivce;
import com.fun.subPage.dto.projectDTO;
import com.fun.subPage.dto.rewardDTO;

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
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("userID");
		
		//String id = "user1";
		List<backerDTO> bDTO = mService.getBacker(id);
		
		// 후원목록
		prDTO PR = mService.getProject_back(bDTO);
		
		// 관심목록 / 내 프로젝트
		List<projectDTO> project_LIKE = mService.getProject_Like(bDTO);
		List<projectDTO> getMyProject = mService.getMyProject(id);
		
		// model에 붙혀서 전달
		model.addAttribute("backList", PR.getpList());
		model.addAttribute("rewardList", PR.getrDTO());
		model.addAttribute("addMoney", PR.getAddMoney());
		model.addAttribute("likeList", project_LIKE);
		model.addAttribute("myList", getMyProject);
		
	}
	// 카드,계좌
	 @RequestMapping(value="/mymy", method=RequestMethod.GET)
	   public void projectList(Model model, cardInfoDTO cDTO, HttpServletRequest req) throws Exception {
	      
	      System.out.println("마이 컨트롤러(2) 실행");
	      // 카드 정보 뿌리기
	      // 계좌 정보 뿌리기
	      HttpSession session = req.getSession();
	      String id = (String)session.getAttribute("userID");
	      //String id = "user1";
	      cDTO.setId(id);
	   
	   
	      System.out.println("MyController cardList() 시작");
	      
	      List<cardInfoDTO> List_CARD = mService.List_CARD(id);
	      List<accountInfoDTO> List_ACCOUNT = mService.List_ACCOUNT(id);
	      System.out.println("MyController cardList() Data ==> " + List_CARD);
	      model.addAttribute("CardList", List_CARD);
	      System.out.println("MyController accountList() Data ==> " + List_ACCOUNT);
	      model.addAttribute("AccountList", List_ACCOUNT);      
	   }
	
	@RequestMapping(value="/juso.do", method=RequestMethod.GET)
	public ModelAndView getJuso(Model model) throws Exception {
		ModelAndView mvc = new ModelAndView();
		mvc.setViewName("/popup/jusoPopup");
		return mvc;
	}
	// 회원정보 수정화면으로 이동
	@RequestMapping(value="/mymy.do", method=RequestMethod.GET)
	public ModelAndView getUserInfo(Model model, HttpServletRequest req) throws Exception {
		
		// 세션으로 아이디 값 가져오기
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("userID");
		//String id ="user1";
		
		// 아이디로 userinfo 받아오기
		userinfoDTO dto = mService.getUserInfo(id);
		
		if(dto.getProfile_img() == null || dto.getProfile_img() == "") {
			dto.setProfile_img("images/profile/detail01.jpg");
		} else {
			File file = new File(dto.getProfile_img());
		}
		
		List<cardInfoDTO> cardList = mService.List_CARD(dto.getId());
	    List<accountInfoDTO> accountList = mService.List_ACCOUNT(dto.getId());
		
	    session.setAttribute("nickName", dto.getName());
		session.setAttribute("profile", dto.getProfile_img());
	    
		ModelAndView mvc = new ModelAndView();
		mvc.addObject("userInfo", dto);
		mvc.addObject("cardList", cardList); 
		mvc.addObject("accountList", accountList);
		mvc.setViewName("/myPage/mymy");
		return mvc;
	}
	
	// 회원정보 수정하기
	@ResponseBody
	@RequestMapping(value = "/mymyUpdate.do", method = RequestMethod.POST)
	public String updateUserInfo(Locale locale, Model model, @RequestParam Map<String,String> userInfo) throws Exception {
		if (userInfo.get("pass").equals(userInfo.get("pass_re"))) {
			userinfoDTO dto = new userinfoDTO();
			
			// 회원정보 수정 후 비밀번호 암호화
			dto.setUserInfo(userInfo);
			System.out.println("받아온 닉네임 값 ::: " + dto.getName());
			if(mService.mymyUpdate(dto) > 0) {
				return "Y";
			} else {
				return "N";
			}
		} else {
			return "N";
		}
	}

	// 프로필 사진 업로드
	@ResponseBody
	@RequestMapping(value = "/imgUpload.do", method = RequestMethod.POST)
	public String result(@RequestParam("file1") MultipartFile multi,HttpServletRequest request,HttpServletResponse response, Model model) {
    	try {
            if(!multi.isEmpty())
            {
                String originFilename = multi.getOriginalFilename();
                String Path = request.getSession().getServletContext().getRealPath("/");
                File file = new File(Path + "/resources/images/profile/" , originFilename);
                multi.transferTo(file);
                userinfoDTO dto = new userinfoDTO();
                dto.setId(request.getParameter("id"));
                dto.setProfile_img("images/profile/" + originFilename);
                int result = mService.updateProfile(dto);
                if (result > 0) {
                	return "Y";
                }
            }
    	} catch(Exception e) {
            System.out.println(e);
        }
		return "N";
	}
	
	// 회원 탈퇴
	@ResponseBody
	@RequestMapping(value="/dropUser.do", method=RequestMethod.POST)
	@Transactional
	public String dropUser(Model model, HttpServletRequest req) throws Exception {
		
		String id = req.getParameter("id");
		System.out.println("탈퇴할 아이디 : " + id);
		
		// 후원목록을 가져오고 후원 기록을 삭제함
		List<backerDTO> bDTO = mService.getBacker(id);
		prDTO PR = mService.getProject_back(bDTO);
		for(int i = 0; i < PR.getpList().size(); i++) {
			PR.getpList().get(i).setP_total(PR.getAddMoney().get(i) + PR.getrDTO().get(i).getR_price());
			mService.cancel_project(PR.getpList().get(i)); // 후원한 프로젝트 테이블을 수정
			
			mService.cancel_reward(PR.getrDTO().get(i)); // 리워드 테이블도 수정
		}

		// 프로젝트 테이블+reward 테이블, backer 테이블, userinfo 테이블 삭제
		String result = null;
		if(mService.drop_User(id) > 0) {
			result = "Y";
		} else result = "N";
				
		return result;
	}
	
	// 관심 목록 삭제
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
	
	@ResponseBody
	@RequestMapping(value="/deleteBack.do", method=RequestMethod.POST)
	@Transactional
	// 후원 목록 삭제
	public String deleteBack(Model model, HttpServletRequest req, backerDTO bDTO) throws Exception {
		
		// 아이디는 세션에서 받아옴
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("userID");
		bDTO.setId(id);
		bDTO.setIs_like('N');
		bDTO.setP_seq(Integer.parseInt(req.getParameter("p_seq")));
		
		// 'Y'는 등록 성공 'D'는 중복 있음 'N'은 에러 'F'는 로그인 안됨
		String result = null;
		
		// 로그인 여부 확인
		if(session.getAttribute("isLogin") != null) {
			
			// p_seq, r_seq, r_price, r_addMoney 받아와야함
			projectDTO pDTO = new projectDTO();
			pDTO.setP_seq(Integer.parseInt(req.getParameter("p_seq")));
			pDTO.setP_total(Integer.parseInt(req.getParameter("p_total")));
			rewardDTO rDTO = new rewardDTO();
			rDTO.setP_seq(Integer.parseInt(req.getParameter("p_seq")));
			rDTO.setR_seq(Integer.parseInt(req.getParameter("r_seq")));
			
			// 테이블 세개 수정함 cancel_back은 backer테이블 수정 & cancel_project는 project테이블 수정 & cancel_reward는 reward 테이블 수정
			// DB에 등록이 성공한 경우.
			if(mService.deleteProject(bDTO) == 1 && mService.cancel_project(pDTO) == 1 && mService.cancel_reward(rDTO) == 1) {
				System.out.println("등록성공");
				result = "Y";
			} // 등록에 실패한 경우
			else {
				System.out.println("등록실패");
				result = "N";
			}
			
		} else { result="F"; }
		
		return result;
	}
	
	// 등록한 프로젝트 삭제
	@ResponseBody
	@RequestMapping(value="/deleteMyProject.do", method=RequestMethod.POST)
	public String deleteMyProject(Model model, HttpServletRequest req, projectDTO pDTO) throws Exception {
		
		System.out.println("마이페이지에서 받아온 p_Seq값 : " + pDTO.getP_seq());
		
		String result = null;
		if(mService.deleteMyProject(pDTO) <= 1) { // 삭제가 성공한 경우
			System.out.println("삭제성공");
			result = "Y";
		} // 삭제에 실패한 경우
		else {
			System.out.println("삭제실패");
			result = "N";
		}
		backerDTO bDTO = new backerDTO();
		bDTO.setP_seq(pDTO.getP_seq());
		if(mService.deleteMyProject2(bDTO) <= 1) { // 삭제가 성공한 경우
			System.out.println("삭제성공");
			result = "Y";
		} // 삭제에 실패한 경우
		else {
			System.out.println("삭제실패");
			result = "N";
		}
		
		return result;
	}
	// 등록한 프로젝트 삭제시 찜목록, 후원목록 삭제
	@ResponseBody
	@RequestMapping(value="/deleteMyProject2.do", method=RequestMethod.POST)
	public String deleteMyProject(Model model, HttpServletRequest req, backerDTO bDTO) throws Exception {
		
		System.out.println("마이페이지에서 받아온 p_Seq값 : " + bDTO.getP_seq());
	
		String result = null;
		if(mService.deleteMyProject2(bDTO) <= 1) { // 삭제가 성공한 경우
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
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userID");
		cDTO.setId(id);
		int result = mService.addCard(cDTO);

		ModelAndView mav	= new ModelAndView();


		mav.setViewName("redirect:/myPage/mymy.do");
		return mav;
	}
	
	// 계좌 정보 입력
	@RequestMapping(value="/addAccount.do", method=RequestMethod.POST)
	public ModelAndView addAcoount(@ModelAttribute("accountInfoDTO") accountInfoDTO aDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userID");
		aDTO.setId(id);
		int result = mService.addAccount(aDTO);

		ModelAndView mav	= new ModelAndView();

		mav.setViewName("redirect:/myPage/mymy.do");
		return mav;
	}
	
	@RequestMapping(value="/deleteCard.do", method=RequestMethod.POST)
	public ModelAndView deleteCard(@ModelAttribute("cardInfoDTO") cardInfoDTO cDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userID");
		cDTO.setId(id);
		int result = mService.deleteCard(cDTO);

		ModelAndView mav	= new ModelAndView();
		mav.setViewName("redirect:/myPage/mymy.do");
		return mav;
	}
	
	// 계좌 정보 입력
	@RequestMapping(value="/deleteAccount.do", method=RequestMethod.POST)
	public ModelAndView deleteAccount(@ModelAttribute("accountInfoDTO") accountInfoDTO aDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userID");
		aDTO.setId(id);
		int result = mService.deleteAccount(aDTO);

		ModelAndView mav	= new ModelAndView();
		mav.setViewName("redirect:/myPage/mymy.do");
		return mav;
	}
}





