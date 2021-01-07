package com.hokwang.mobile.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MobileController {

	@RequestMapping(value = "/child")
	public String child() {
		return "mobile/childManage";
	}

	@RequestMapping(value = "/pay")
	public String pay() {
		return "mobile/payment";
	}

	@RequestMapping(value = "/doc")
	public String doc() {
		return "mobile/document";
	}

	@RequestMapping(value = "/resv")
	public String resv(HttpServletRequest request, Model model) {
		String type = request.getParameter("type");
		System.out.println("type : "+type);
		model.addAttribute("resvType", type);
		return "mobile/reservation";
	}
}
