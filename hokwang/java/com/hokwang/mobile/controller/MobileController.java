package com.hokwang.mobile.controller;

import org.springframework.stereotype.Controller;
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
	public String resv() {
		
		return "mobile/reservation";
	}
}
