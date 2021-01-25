package com.hokwang.mobile.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.DocService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.Reservation;

@Controller
public class DocController {
	@Autowired
	DocService service;

	@RequestMapping(value = "/maindoc")
	public String maindoc(Reservation vo, @RequestParam String resv_no, @RequestParam Map map) {
		vo.setResv_no(resv_no);
		System.out.println(map);
		if ("true".equals(map.get("imp_success"))) {
			service.updateDocStatus(vo);
		}
		return "redirect:doc";
	}

	@ResponseBody
	@RequestMapping("/ajax/successDoc")
	public boolean updateDocStatus(Reservation vo) {
		service.updateDocStatus(vo);
		return true;
	}

	@ResponseBody
	@RequestMapping(value = "/ajax/printDoc") // 값뿌리기 pdf
	public Map<String, Object> createForm(Reservation vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("diagnosisDoc", service.diagnosisDoc(vo));
		map.put("mediDoc", service.mediDoc(vo));
		return map;
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
