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
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

@Controller
public class BabyDiaryController {
	@Autowired
	BabyDiaryService service;

	@ResponseBody
	@RequestMapping("/ajax/reserlist")
	public List<Reservation> reserlist(Reservation vo,HttpSession session) {
		//vo.setResv_no(((ParentVO) session.getAttribute("parent_vo")).getEmp_no());
		System.out.println(vo);
		return service.reserlist(vo);//예약리스트
	}
	@ResponseBody
	@RequestMapping("/ajax/question")
	public List<QuestionVO> aa(QuestionVO vo) {
		return service.question(vo);
	}
	@ResponseBody
	@RequestMapping("/ajax/getBabyInfo")
	public List<BabyVO> getBabyList(BabyVO vo,HttpSession session){
		//vo.setParent_no(((ParentVO) session.getAttribute("parent_vo")).getParent_no());
		return service.getBabyList(vo);
		
	}
	
	@ResponseBody
	@RequestMapping("/ajax/getBabyInfo2")
	public List<BabyVO> getBabyinfo(BabyVO vo,HttpSession session){
		//vo.setParent_no(((ParentVO) session.getAttribute("parent_vo")).getParent_no());
		return service.getBabyinfo(vo);
		
	}
	@ResponseBody
	@RequestMapping("/ajax/allreser")
	public List<Map<String,Object>> getallreser(Reservation vo){
		return service.allreser(vo);
		
	}

}
