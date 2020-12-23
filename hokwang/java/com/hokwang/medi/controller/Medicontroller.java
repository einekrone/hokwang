package com.hokwang.medi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.hokwang.vo.MedicineVO;

@Controller
public class Medicontroller {
	//@Autowired
	//MediMapper dao;

	// 페이지이동하는
	/*
	 * @RequestMapping("/medicine") public ModelAndView diagForm(MedicineVO vo) {
	 * ModelAndView mav = new ModelAndView(); mav.setViewName("medicine"); return
	 * mav; }
	 */
	
	
	@RequestMapping("/medicine")
	public String medicine(Model model) {
		return "medicine";
	}
	
	
	
	
}
