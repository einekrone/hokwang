package com.hokwang.resv.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.dao.ResvMapper;
import com.hokwang.vo.Reservation;

@Controller
public class ResvController {
	@Autowired
	ResvMapper resvDao;

	// 페이지 이동
	@RequestMapping("/resve")
	public ModelAndView resvForm(Reservation resv) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserve");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/resvList")
	public List<Map<String, Object>> resvList() {
		return resvDao.getResvList();
	}
}
