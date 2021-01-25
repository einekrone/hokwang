package com.hokwang.mobile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hokwang.mobile.service.DocService;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvCalendar;

@Controller
public class MobileController {
	@Autowired DocService service;
	/*
	 * @RequestMapping(value = "/loginM") public String login() { //return "loginM";
	 * return "mobile/loginM"; }
	 */

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
	@RequestMapping(value = "/babyDiary")
	public String rservation() {
		return "mobile/babyDiary";
	}
	@RequestMapping(value = "/resv")
	public String resv(HttpServletRequest request, Model model, HttpServletResponse response, ResvCalendar vo) {
		String type = request.getParameter("type");
		model.addAttribute("resvType", type);
		return "mobile/reservation";
	}
	@RequestMapping(value = "/popup")
	public String popup() {
		return "mobile/popup";
	}
}
