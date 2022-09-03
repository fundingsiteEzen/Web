package com.fun.crpage.controller;

import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fun.crpage.dto.CrDTO;
import com.fun.crpage.dto.rewardDTO;
import com.fun.crpage.service.CrService;
import com.fun.util.UploadFileUtils;


//------------------------------------------------------------------------------------------------------------
// crpage 컨트롤러
//------------------------------------------------------------------------------------------------------------
@Controller
@RequestMapping(value = "/crpage")
public class crcontroller {

	@Inject 
	private CrService crService;
	
	// 이미지 파일 저장할경로. 현재 안 씀
//	@Resource(name = "uploadPath")
//	String uploadPath;
	
	
	@RequestMapping(value = "/cr", method = RequestMethod.GET)
	public void crGET() {
		
		System.out.println("crController의 crGET 시작");
		
	}

	//-----------------------------------------------------------------------------------------------------------
	// 프로젝트 등록 처리 
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/cr", method = RequestMethod.POST)
	@Transactional
	public ModelAndView addMember(@ModelAttribute("crInsert") CrDTO crDTO, rewardDTO rDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		// p_seq 생성. 랜덤 6자리 수
		Random rand = new Random();
		String p_seq = Integer.toString(rand.nextInt(8) + 1);
		for (int i = 0; i < 5; i++) {
			p_seq += Integer.toString(rand.nextInt(9));
		}
		
		// 생성한 p_seq를 crDTO, rDTO에 세팅
		for(int i = 0; i < rDTO.getList().size(); i++) {
			rDTO.getList().get(i).setP_seq(Integer.parseInt(p_seq));
		}
		crDTO.setP_seq(Integer.parseInt(p_seq));
		
		
		// 프로젝트 테이블에 등록
		System.out.println("CrController의 crInsert() crDTO 데이터 => " + crDTO);
		
		String str = crDTO.getP_slide();
		String[] strArr = str.split(",");
		System.out.println("p_thumb의 값 ::: " + crDTO.getP_thumb());
		int p_thumb = Integer.parseInt(crDTO.getP_thumb());
		crDTO.setP_thumb(strArr[p_thumb]); // 받은 이미지의 첫번째 사진을 썸네일 이미지로 지정함
		crDTO.setP_imgCnt(strArr.length); // 첨부한 이미지의 갯수를 저장함
		
		int result = 0;
		result = crService.crInsert(crDTO);
		
		// 리워드 테이블에 등록
		System.out.println("추가된 리워드의 값 : " + rDTO.getList());
		crService.insertReward(rDTO);
		
		ModelAndView mav = new ModelAndView("redirect:/myPage/myPage"); // 작성이 끝나면 마이페이지로 돌아감

		return mav;
	}
	
	
	// 이미지 등록 처리
	@RequestMapping(value="/file", method=RequestMethod.POST)
	public String inputFile(List<MultipartFile> file, HttpServletRequest req) throws Exception {
		
		System.out.println("이미지 등록 thumb값 :: " + req.getParameter("p_thumb"));
		
		String contextRoot = new HttpServletRequestWrapper(req).getRealPath("/");
		String thumbPath = contextRoot + "resources/images/thumnail";
		String slidePath = contextRoot + "resources/images/SUB";
		System.out.println("리스트 가져옴 :: " + file);
		
		for(int i = 0; i < file.size(); i++) {
			System.out.println("파일명 : " + file.get(i).getOriginalFilename());
		}
//		System.out.println("파일크기 : " + file.getSize());
//		System.out.println("컨텐츠 타입 : " + file.getContentType());
		
		int p_thumb = Integer.parseInt(req.getParameter("p_thumb"));
		for(int i = 0; i < file.size(); i++) {
				new ResponseEntity<String>(
						UploadFileUtils.uploadThumbFile(thumbPath, file.get(i).getOriginalFilename(), file.get(i).getBytes()), HttpStatus.OK);
				new ResponseEntity<String>(
						UploadFileUtils.uploadFile(slidePath, file.get(i).getOriginalFilename(), file.get(i).getBytes()), HttpStatus.OK);
		}
		
		return "성공";
	}
	
	
}