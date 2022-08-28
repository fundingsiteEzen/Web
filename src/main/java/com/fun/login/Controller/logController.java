package com.fun.login.Controller;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fun.login.service.logService;
import com.fun.subPage.dto.newUserinfoDTO;
import com.fun.subPage.dto.userinfoDTO;

@Controller
public class logController {
	
	// 멤버객체
//	@Autowired
//	private userinfoDTO dto;
//	@Autowired
//	private logService lService;
	
	@Autowired
	logService lSerivce;
	
	private static String RSA_WEB_KEY = "_RSA_WEB_Key_"; // 개인키 session key
	private static String RSA_INSTANCE = "RSA";

	
	// 0. 로그인 화면으로 이동
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView loginHome(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		System.out.println("0. 로그인 컨트롤러");
		
		// RSA키 생성
		initRsa(req);
		ModelAndView mav = new ModelAndView("login/login");
		
		return mav;
	}
	
	// 0. 회원가입 화면으로 이동
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String registerHome() throws Exception {
		System.out.println("로그 컨트롤러.회원가입");
		return "login/register";
	}
	
	// 1. RSA 로그인 처리
	@RequestMapping("/rsalogin.do")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String userId = (String) req.getParameter("USER_ID");
		String userPw = (String) req.getParameter("USER_PW");
		System.out.println("유저아이디 " + userId);
		
		HttpSession session = req.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute(logController.RSA_WEB_KEY);
		
		// 복호화
		userId = decryptRsa(privateKey, userId);
		userPw = decryptRsa(privateKey, userPw);
		
		// 개인키 삭제
		session.removeAttribute(logController.RSA_WEB_KEY);
		
		userinfoDTO userinfo = new userinfoDTO();
		userinfo.setId(userId);
		userinfo.setPass(userPw);
		
		ModelAndView mav = new ModelAndView();
		// 로그인 시도한 정보와 DB 정보를 대조함. 해당 정보가 있을 경우 객체 반환
		userinfoDTO uDTO = lSerivce.login(userinfo);
			
			// 해당 정보가 있을 경우
			if(uDTO != null) {
				
				// 아이디와 비밀번호가 일치할 경우
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				boolean match = passwordEncoder.matches(userinfo.getPass(), uDTO.getPass());
				System.out.println("복호화 끝난 값 : " + match);
				if(match) {
					// 세션을 만들고, 세션에 해당 로그인 정보를 붙힘
					session.setAttribute("userID", uDTO.getId());
					session.setAttribute("isLogin", true);
					session.setAttribute("nickName", uDTO.getName());
					mav.setViewName("redirect:/");
					System.out.println("로그인 완료");
				} // 비밀번호가 일치하지 않는 경우
				else {
					System.out.println("비밀번호 불일치");
					mav.setViewName("redirect:/login.do");
				}
			} // 정보가 없을 경우
			else {
				System.out.println("아이디 정보 없음");
				mav.setViewName("redirect:/login.do");
			};

		return mav;
	}
	
	
	// 2. 로그아웃 처리
	@RequestMapping(value="/logout.do",  method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session = req.getSession();
		
		System.out.println(session.getAttribute("isLogin").toString());
		
		// 나는 여기에 if session != null 을 감쌌는데 크게 필요 없는듯.
		session.removeAttribute("userID");
		session.removeAttribute("isLogin");
		// 이거 invalid어쩌구로 session 삭제해주기.. 로그아웃했다가 재 로그인 하는 경우도 생각
		
		ModelAndView mav = new ModelAndView("redirect:/");
		
		return mav;
	}
	
	
	// 3. 회원가입
	@RequestMapping(value="/addMember.do", method=RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("userinfo") newUserinfoDTO uDTO, HttpServletRequest req, HttpServletResponse res)
		throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");
		
		System.out.println("입력받은 값 : " + uDTO);
		
		// 비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		uDTO.setPass(passwordEncoder.encode(uDTO.getPass())); // 비밀번호 암호화
		System.out.println("암호화 끝난 값" + uDTO.getPass());
		uDTO.setName(uDTO.getId());
		uDTO.setUser_auth("USER");
		
		int result = lSerivce.addMember(uDTO);
		
		ModelAndView mav = new ModelAndView("redirect:/"); // 로그인 완료되면 메인으로 돌아감
		
		return mav;
	}
	
	// 3-2. 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	public int checkId(HttpServletRequest req) throws Exception {
		
		String id = req.getParameter("id");
		System.out.println("회원가입 아이디 : " + id);
		
		return lSerivce.checkId(id);
	}
	

	////// RSA 복호화 등등 //////
	// 복호화
	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
		Cipher cipher = Cipher.getInstance(logController.RSA_INSTANCE);
		byte[] encryptedBytes = hexToByteArray(securedValue);
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
		String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
		return decryptedValue;
	}

	// 16진 문자열을 byte 배열로 변환
	public static byte[] hexToByteArray(String hex) {
		if (hex == null || hex.length() % 2 != 0) { return new byte[] {}; }
		
		byte[] bytes = new byte[hex.length() / 2];
		for (int i = 0; i < hex.length(); i += 2) {
			byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
			bytes[(int) Math.floor(i / 2)] = value;
		}
		return bytes;
	}
	
	// RSA 공개키, 개인키 생성
	public void initRsa(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		KeyPairGenerator generator;
		
		try {
			generator = KeyPairGenerator.getInstance(logController.RSA_INSTANCE);
			generator.initialize(1024);
			
			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance(logController.RSA_INSTANCE);
			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();
			
			session.setAttribute(logController.RSA_WEB_KEY, privateKey); // session에 RSA 개인키를 세션에 저장
			
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
			
			request.setAttribute("RSAModulus", publicKeyModulus); // rsa modulus 를 request 에 추가
			request.setAttribute("RSAExponent", publicKeyExponent); // rsa exponent 를 request 에 추가
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 현재 안 쓰는 메서드
	// 정보 대조를 위해 아이디, 비밀번호를 뷰에서 받아옴. dto로 받고 dto를 통째로 서비스쪽으로 넘겨줌
//	@RequestMapping(value="/idsearch.do", method=RequestMethod.POST)
//	public ModelAndView searchID(@ModelAttribute("userinfo") userinfoDTO userinfo, RedirectAttributes rAttr, HttpServletRequest req,
//			HttpServletResponse res) throws Exception {
//		
//		ModelAndView mav = new ModelAndView();
//		System.out.println("브라우저에서 입력받은 아이디 : " + userinfo.getId());
//		System.out.println("브라우저에서 입력받은 비번 : " + userinfo.getPass());
//	
//		// 로그인 시도한 정보와 DB 정보를 대조함. 해당 정보가 있을 경우 객체 반환
//		userinfoDTO uDTO = lSerivce.login(userinfo);
//			
//			// 해당 정보가 있을 경우
//			if(uDTO != null) {
//				
//				// 아이디와 비밀번호가 일치할 경우
//				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//				boolean match = passwordEncoder.matches(userinfo.getPass(), uDTO.getPass());
//				System.out.println("복호화 끝난 값 : " + match);
//				if(match) {
//					// 세션을 만들고, 세션에 해당 로그인 정보를 붙힘
//					HttpSession session = req.getSession();
//					session.setAttribute("userID", uDTO.getId());
//					session.setAttribute("isLogin", true);
//					mav.setViewName("redirect:/");
//					System.out.println("로그인 완료");
//				} // 비밀번호가 일치하지 않는 경우
//				else {
//					System.out.println("비밀번호 불일치");
//					rAttr.addAttribute("result", "passwordFailed");
//					mav.setViewName("redirect:/login.do");
//				}
//			} // 정보가 없을 경우
//			else {
//				// rAttr에 (?result=loginFailed)를 붙혀서 보냄
//				System.out.println("아이디 정보 없음");
//				rAttr.addAttribute("result", "loginFailed");
//				mav.setViewName("redirect:/login.do");
//			}
//		
//		return mav;
//	}
	
}
