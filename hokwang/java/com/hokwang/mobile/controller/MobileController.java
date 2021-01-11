package com.hokwang.mobile.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.ResvmService;
import com.hokwang.vo.ParentVO;
import com.hokwang.vo.ResvCalendar;
import com.hokwang.vo.ResvSearch;

@Controller
public class MobileController {
	@Autowired
	ResvmService resvmSvc;

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
		System.out.println("type : "+type);
		model.addAttribute("resvType", type);
		return "mobile/reservation";
	}
	
	// 예약 자녀 리스트
	@ResponseBody
	@RequestMapping("/ajax/childList")
	public List<Map<String, Object>> getChildList(ParentVO vo) {
		return resvmSvc.getChildList(vo);
	} 
}
