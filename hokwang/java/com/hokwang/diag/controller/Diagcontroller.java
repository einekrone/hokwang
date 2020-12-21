package com.hokwang.diag.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Diagcontroller {
	
	@RequestMapping("/diagnosis")
	public String diagForm(Model model) {
		model.addAttribute("patient","이동욱");
		
		return "diagnosis";
	}
}
