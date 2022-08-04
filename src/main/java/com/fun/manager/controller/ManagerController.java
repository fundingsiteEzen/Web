package com.fun.manager.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	
	//-----------------------------------------------------------------------------------------------------------
	// 메인 화면 불러오기
	//-----------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/manager.do", method = RequestMethod.GET)
	public String main() {
		return "/manager/manager";
	}
	
	
	
	
} // End - public class HomeController









