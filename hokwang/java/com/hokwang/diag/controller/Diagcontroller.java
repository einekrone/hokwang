package com.hokwang.diag.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.dao.DiagMapper;
import com.hokwang.service.UserService;
import com.hokwang.vo.BabyVO;

@Controller
public class Diagcontroller {
	@Autowired
	DiagMapper dao;
	
	@ResponseBody
	@RequestMapping("/diagnosis")
	public ModelAndView diagForm(BabyVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.getDiagList());
		mav.setViewName("diagnosis");
		return mav;
	}
}
