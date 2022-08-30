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
import com.fun.myPage.dto.userinfoDTO;
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
		
		if(dto.getProfile_img() == null || dto.getProfile_img() == "") {
			dto.setProfile_img("images/profile/detail01.jpg");
		} else {
			File file = new File(dto.getProfile_img());
		}
		
		List<cardInfoDTO> cardList = mService.List_CARD(dto.getId());
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
		if (userInfo.get("pass").equals(userInfo.get("pass_re"))) {
			userinfoDTO dto = new userinfoDTO();
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





