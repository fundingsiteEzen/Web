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
		//HttpSession session = req.getSession();
		//String id = (String)session.getAttribute("userID");
		
		String id = "user1";
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
	      //HttpSession session = req.getSession();
	      //String id = (String)session.getAttribute("userID");
	      String id = "user1";
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
	public ModelAndView getUserInfo(Model model) throws Exception {
		userinfoDTO dto = mService.getUserInfo("user1");
		
		// 사용자가 저장한 프로필 사진이 없으면 기본 사진 detail01 보여줌
		if(dto.getProfile_img() == null || dto.getProfile_img() == "") {
			dto.setProfile_img("images/profile/detail01.jpg");
		} else {
			// 프로필 사진 파일객체 생성
			File file = new File(dto.getProfile_img());
		}
		
		// 카드 정보 조회
		List<cardInfoDTO> cardList = mService.List_CARD(dto.getId());
		// 계좌 정보 조회
	    List<accountInfoDTO> accountList = mService.List_ACCOUNT(dto.getId());
		
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
		// 비밀번호랑 비밀번호 확인 값을 체크
		if (userInfo.get("pass").equals(userInfo.get("pass_re"))) {
			userinfoDTO dto = new userinfoDTO();
			// Map -> DTO
			dto.setUserInfo(userInfo);
			if(mService.mymyUpdate(dto) > 0) {
				return "Y";
			} else {
				return "N";
			}
		} else {
			return "N";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/imgUpload.do", method = RequestMethod.POST)
	public String result(@RequestParam("file1") MultipartFile multi,HttpServletRequest request,HttpServletResponse response, Model model) {
    	try {
    		// 파일이 존재하면 수행
            if(!multi.isEmpty())
            {
                String originFilename = multi.getOriginalFilename();
                // 프로젝트의 resources 경로를 가져옴
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
	
	// 카드 정보 입력
	
	@RequestMapping(value="/addCard.do", method=RequestMethod.POST)
	public ModelAndView addCard(@ModelAttribute("cardInfoDTO") cardInfoDTO cDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		cDTO.setId("user1");
		int result = mService.addCard(cDTO);

		ModelAndView mav	= new ModelAndView();


		mav.setViewName("redirect:/myPage/mymy.do");
		return mav;
	}
	
	// 계좌 정보 입력
	@RequestMapping(value="/addAccount.do", method=RequestMethod.POST)
	public ModelAndView addAcoount(@ModelAttribute("accountInfoDTO") accountInfoDTO aDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		aDTO.setId("user1");
		int result = mService.addAccount(aDTO);

		ModelAndView mav	= new ModelAndView();

		mav.setViewName("redirect:/myPage/mymy.do");
		return mav;
	}
	
	@RequestMapping(value="/deleteCard.do", method=RequestMethod.POST)
	public ModelAndView deleteCard(@ModelAttribute("cardInfoDTO") cardInfoDTO cDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		cDTO.setId("user1");
		int result = mService.deleteCard(cDTO);

		ModelAndView mav	= new ModelAndView();
		mav.setViewName("redirect:/myPage/mymy.do");
		return mav;
	}
	
	// 계좌 정보 입력
	@RequestMapping(value="/deleteAccount.do", method=RequestMethod.POST)
	public ModelAndView deleteAccount(@ModelAttribute("accountInfoDTO") accountInfoDTO aDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		aDTO.setId("user1");
		int result = mService.deleteAccount(aDTO);

		ModelAndView mav	= new ModelAndView();
		mav.setViewName("redirect:/myPage/mymy.do");
		return mav;
	}
}





