package com.hokwang.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.BabyDiaryService;
import com.hokwang.vo.Reservation;

@Controller
public class BabyDiaryController {
	@Autowired
	BabyDiaryService service;

	@ResponseBody
	@RequestMapping("/ajax/reserlist")
	public List<Reservation> reserlist(Reservation vo) {
		return service.reserlist(vo);//예약리스트
		
	}
}
