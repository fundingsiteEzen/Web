package com.fun.crpage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/crpage")
public class crcontroller {
	
	private static final Logger logger = LoggerFactory.getLogger(crcontroller.class);
	
	@RequestMapping(value = "/cr", method = RequestMethod.GET)
	public void crGET() {
		
		logger.info("창작 등록 페이지 진입");
		 
	}

}