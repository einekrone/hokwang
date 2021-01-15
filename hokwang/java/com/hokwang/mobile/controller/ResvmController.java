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
	public List<CheckupVO> getVacList(BabyVO vo, Model model) {
		List<CheckupVO> list = resvmSvc.getVacList(vo);
		model.addAttribute("vacList", list);
		return list;
	}


	// 예약 등록(+문진표, 알림)
	@ResponseBody
	@RequestMapping("/ajax/insertReservation")
	public String questInsert(QuestionVO quVO, Reservation resvVO) {
		resvmSvc.resvInsert(resvVO);
		quVO.setQust_no(resvVO.getResv_no());
		resvmSvc.questInsert(quVO);
		// 예약한 아기 번호를 외래키로 받아서 alert에 insert
		return "redirect:/mobile";
	}
}
