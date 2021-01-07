package com.hokwang.comm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.vo.Reservation;

@Controller
public class HomeController {

	@RequestMapping(value = "/")
	public ModelAndView test(HttpServletResponse response) throws IOException {
		return new ModelAndView("/login");//경로
	}

	@RequestMapping(value = "/usermsg")
	public String usermsg() {
		return "user/tab1";
	}

	/*
	 * @RequestMapping(value = "/mypage") public String mypage() { return
	 * "user/mypage"; }
	 */

	@RequestMapping(value = "/base")
	public String base() {
		return "layout/base";
	}

	@RequestMapping(value = "/mobile")
	public String mobile() {
		return "mobile/main";
	}

	@RequestMapping(value = "/mmypage")
	public String mypage() {
		return "mobile/mypage";
	}
}
