package com.fun.crpage.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	// 이미지 파일 저장할경로
	@Resource(name = "uploadPath")
	String uploadPath;
	
	
	@RequestMapping(value = "/cr", method = RequestMethod.GET)
	public void crGET() {
		
		System.out.println("crController의 crGET 시작");
	}

	//-----------------------------------------------------------------------------------------------------------
	// 프로젝트 등록 처리 
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/cr", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("crInsert") CrDTO crDTO, rewardDTO rDTO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		System.out.println("CrController의 crInsert() crDTO 데이터 => " + crDTO);
		int result = 0;
		result = crService.crInsert(crDTO);
		System.out.println("추가된 리워드의 값 : " + rDTO.getList());
		
		ModelAndView mav = new ModelAndView("redirect:/myPage/myPage");

		return mav;
	}
	
	
	// 이미지 등록 처리
	@RequestMapping(value="/file", method=RequestMethod.POST)
	public ResponseEntity<String> inputFile(MultipartFile file, String id) throws Exception {
		
		System.out.println("파일명 : " + file.getOriginalFilename());
		System.out.println("파일크기 : " + file.getSize());
		System.out.println("컨텐츠 타입 : " + file.getContentType());
		
		
		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
}