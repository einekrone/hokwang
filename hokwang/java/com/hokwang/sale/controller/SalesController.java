package com.hokwang.sale.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.service.SalesService;
import com.hokwang.vo.PaymentVO;
import com.hokwang.vo.Reservation;

@Controller
public class SalesController {
	@Autowired
	SalesService dao;

	// 페이지 이동
	@RequestMapping("/sales")
	public ModelAndView resvForm(Reservation resv) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("sales");
		return mav;
	}
		
	@ResponseBody
	@RequestMapping("/ajax/allSales")
	public Map<String,Object> getCountResv(Model model,PaymentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resv", dao.getCountResv());
		map.put("year",dao.getYearSales());
		map.put("month",dao.getMonthSales());
		map.put("day",dao.getDaySales());
	
		return  map;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/getMonth1")
	public Integer getMonth1(Model model, PaymentVO vo){
		return dao.getMonth1();
	}

}
