package com.hokwang.diag.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.dao.DiagMapper;
import com.hokwang.vo.BabyVO;

@Controller
public class Diagcontroller {
	@Autowired
	DiagMapper dao;

	// 페이지이동하는
	@RequestMapping("/diagnosis")
	public ModelAndView diagForm(BabyVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("diagnosis");
		return mav;
	}

	// 아작스

	@ResponseBody
	@RequestMapping("/ajax/Info")
	public List<Map<String, Object>> getInfoList(Model model, BabyVO vo) {
		return dao.getInfoList();
	}


}
