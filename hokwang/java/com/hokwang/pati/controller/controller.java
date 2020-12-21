package com.hokwang.pati.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class controller {
	
	/*
	 * @GetMapping("/patient") public ModelAndView createForm(){ ModelAndView mv =
	 * new ModelAndView(); mv.setViewName("patient"); mv.addObject("id", "이름여기들어감");
	 * 
	 * return mv; }
	 */
	@RequestMapping("/patient") //.do 같은거
	public String createForm(Model model){
	  model.addAttribute("name", "우청1234");
	  model.addAttribute("id", "아이디들어가는곳");
	  model.addAttribute("city", "대구");
	  
	  return "patient";//jsp경로
	}
	
	@RequestMapping("/reserve") //.do 같은거
	public String createForm2(Model model){
	 // model.addAttribute("name", "우청1234");
	 // model.addAttribute("id", "아이디들어가는곳");
	 // model.addAttribute("city", "대구");
	  
	  return "reserve";//jsp경로
	}

}
