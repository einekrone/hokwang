package com.hokwang.resv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hokwang.dao.ResvMapper;
import com.hokwang.vo.Reservation;

@Controller
public class ResvController {
	@Autowired
	ResvMapper resvMapper;

	@RequestMapping("/resve")
	public String resvList(Model model, Reservation resv) {
//		model.addAttribute("list", resvMapper.getResvList(resv));
		return "reserve";
	}
}
