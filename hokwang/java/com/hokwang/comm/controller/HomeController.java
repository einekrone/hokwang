package com.hokwang.comm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping(value="/")
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("user/login");
	}
	
	@RequestMapping(value="/usermsg")      
	 public String usermsg() {
	    return "user/tab1";            
	  }
	
	@RequestMapping(value="/mypage")      
	 public String mypage() {
	    return "user/mypage";            
	  }
}
