package com.hokwang.mobile.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.BabyDiaryService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.BodyVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.TemporatureVO;

@Controller
public class BabyDiaryController {
	@Autowired
	BabyDiaryService service;

	@ResponseBody
	@RequestMapping("/ajax/reserlist")
	public Map<String, Object> reserlist(Reservation vo) {
		// vo.setResv_no(((ParentVO) session.getAttribute("parent_vo")).getEmp_no());
		Map<String, Object> map = new HashMap<String, Object>(); // 상세진료기록
		map.put("reserlist", service.reserlist(vo));
		map.put("allreser", service.allreser(vo));
		return map;// 예약리스트
	}

	@ResponseBody
	@RequestMapping("/ajax/question")
	public List<QuestionVO> aa(QuestionVO vo) {
		return service.question(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/getBabyInfo")
	public List<BabyVO> getBabyList(BabyVO vo, HttpSession session) {
		// vo.setParent_no(((ParentVO)
		// session.getAttribute("parent_vo")).getParent_no());
		return service.getBabyList(vo);

	}

	@ResponseBody
	@RequestMapping("/ajax/getBabyInfo2")
	public List<BabyVO> getBabyinfo(BabyVO vo, HttpSession session) {
		// vo.setParent_no(((ParentVO)
		// session.getAttribute("parent_vo")).getParent_no());
		return service.getBabyinfo(vo);

	}

	@ResponseBody
	@RequestMapping("/ajax/allreser")
	public List<Map<String, Object>> getallreser(Reservation vo) {
		System.out.println(vo);
		return service.allreser(vo);

	}

	@ResponseBody
	@RequestMapping("/ajax/insertbodyinfo")
	public boolean insertbodyinfo(BodyVO vo) {
		if (service.insertbodyinfo(vo) == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	
	@ResponseBody
	@RequestMapping("/ajax/checkBody")
	public List<BodyVO> checkBody(BodyVO vo) {
		return service.checkBody(vo);

	}
	
	@ResponseBody
	@RequestMapping("/ajax/checkTemporature")
	public List<TemporatureVO> checkTemporature(TemporatureVO vo) {
		return service.checkTemporature(vo);

	}
	
	@ResponseBody
	@RequestMapping("/ajax/deleteInf")
	public int bodyDel(BodyVO vo) {
		return service.bodyDel(vo);
	}
	
	@ResponseBody
	@RequestMapping("/ajax/deleteTemp")
	public int deleteTemp(TemporatureVO vo) {
		return service.deleteTemp(vo);
	}
	
	@ResponseBody
	@RequestMapping("/ajax/insertBodyInf")
	public boolean insertBodyInf(BodyVO vo) {
		service.insertBodyInf(vo);
		return true; 
	}

	@ResponseBody
	@RequestMapping("/ajax/insertTempInf")
	public boolean insertTempInf(TemporatureVO vo) {
		service.insertTempInf(vo);
		return true; 
	}
	
}
