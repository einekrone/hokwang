package com.hokwang.sale.controller;

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
	@RequestMapping("/ajax/showMonthSale")
	public Integer getDaySales(Model model,PaymentVO vo) {
		return dao.getDaySales();
	}
	
	@ResponseBody
	@RequestMapping("/ajax/showDaySale")
	public Integer getMonthSales(Model model,PaymentVO vo) {
		return dao.getMonthSales();
	}
	
	@ResponseBody
	@RequestMapping("/ajax/showYearSale")
	public Integer getYearSales(Model model,PaymentVO vo) {
		return dao.getYearSales();
	}
	
	@ResponseBody
	@RequestMapping("/ajax/showCountResv")
	public Integer getCountResv(Model model,PaymentVO vo) {
		return dao.getCountResv();
	}
	
	
}
