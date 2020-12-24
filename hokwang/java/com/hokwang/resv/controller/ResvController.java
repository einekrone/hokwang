package com.hokwang.resv.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.service.ResvService;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

@Controller
public class ResvController {
	@Autowired
	ResvService resvSvc;

	// 페이지 이동
	@RequestMapping("/resve")
	public ModelAndView resvForm(Reservation resv) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserve");
		return mav;
	}

	@ResponseBody
	@RequestMapping("/ajax/resvList")
	public List<Map<String, Object>> resvList(ResvSearch vo, HttpServletRequest request) {
		
		System.out.println(">>1? "+request.getParameter("searchType"));
		System.out.println(">>2? "+request.getParameter("keyword"));
		System.out.println("목록 불러오는곳");
		return resvSvc.getResvList(vo);
	}
}
