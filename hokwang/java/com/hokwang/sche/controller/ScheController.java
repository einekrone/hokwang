package com.hokwang.sche.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheController {
	
	@RequestMapping("/schedule")
	public String schedule(Model model) {
		return "schedule";
	}

}
