package com.fun.myPage.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/myPage")
public class MyController {
	
	
	@RequestMapping(value="/myInfo", method=RequestMethod.GET)
	public void projectList(Model model) throws Exception {
	
	}
	
}