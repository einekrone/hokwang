package com.hokwang.mobile.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.mobile.service.DocService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.Reservation;

@Controller
public class DocController {
	@Autowired
	DocService service;

	@ResponseBody
	@RequestMapping("/ajax/successDoc")
	public boolean updateDocStatus(Reservation vo) {
		if (service.updateDocStatus(vo) == 1) {
			service.updateDocStatus(vo);
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping(value = "/printDoc")
	public ModelAndView createForm(Model model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mobile/doc");// 여기선 결제로 넘어거야함
		return mav;
	}

	@ResponseBody
	@RequestMapping("/ajax/babyLists")
	public List<BabyVO> babyLists(BabyVO vo) {

		return service.babyLists(vo);// 셀렉트박스 리스트
	}

	@ResponseBody
	@RequestMapping("/ajax/selectBaby")
	public List<Map<String, Object>> selectBaby(BabyVO vo) {

		return service.selectBaby(vo);// 체인지아기
	}
}
