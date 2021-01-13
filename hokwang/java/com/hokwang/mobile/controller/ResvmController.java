package com.hokwang.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.ResvmService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckupVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

@Controller
public class ResvmController {
	@Autowired
	ResvmService resvmSvc;

	// 예약 자녀 리스트
	@ResponseBody @RequestMapping(value="/ajax/childList")

	public List<BabyVO> getChildList(BabyVO vo, Model model) {
		List<BabyVO> list = resvmSvc.getChildList(vo);
		model.addAttribute("childList", list);
		return list;
	}

	// 예약 자녀 리스트
	@ResponseBody
	@RequestMapping(value = "/ajax/vacList")
	public List<CheckupVO> getVacList( Model model) {
		List<CheckupVO> list = resvmSvc.getVacList();
		model.addAttribute("vacList", list);
		return list;
	}


	// 문진표 등록
	@ResponseBody
	@RequestMapping("/ajax/insertReservation")
	public String questInsert(QuestionVO quVO, Reservation resvVO) {
		resvmSvc.resvInsert(resvVO);
		quVO.setQust_no(resvVO.getResv_no());
		resvmSvc.questInsert(quVO);
		return "redirect:/mobile";
	}
}
