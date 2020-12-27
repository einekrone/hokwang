package com.hokwang.resv.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.service.ResvService;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

@Controller
public class ResvController {
	@Autowired
	ResvService resvSvc;

	// 페이지 이동
	@RequestMapping("/resve")
	public ModelAndView resvForm(Reservation resv) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserve");
		return mav;
	}

	// 전체 예약 리스트 조회
	@ResponseBody
	@RequestMapping("/ajax/resvList")
	public List<Map<String, Object>> getResvList(ResvSearch vo) {
		return resvSvc.getResvList(vo);
	}
	
	// 선택된 환자 예약/진료 이력 리스트 조회
	@ResponseBody
	@RequestMapping("/ajax/resvHstList")
	public List<Map<String, Object>> getResvHistList(Reservation vo) {
		return resvSvc.getResvHistList(vo);
	}
	
	// 선택된 환자 상세 정보
	@ResponseBody
	@RequestMapping("/ajax/ptInfo")
	public Map<String, Object> getPtInfo(Reservation vo) {
		return resvSvc.getPtInfo(vo);
	}
}
