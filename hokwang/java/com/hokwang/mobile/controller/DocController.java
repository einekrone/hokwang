package com.hokwang.mobile.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.DocService;
import com.hokwang.vo.BabyVO;

@Controller
public class DocController {
	@Autowired
	DocService service;

	@ResponseBody
	@RequestMapping("/ajax/babyLists")
	public List<BabyVO> babyLists(BabyVO vo){
		
		return service.babyLists(vo);//셀렉트박스 리스트
	}
	
	@ResponseBody
	@RequestMapping("/ajax/selectBaby")
	public List<Map<String,Object>> selectBaby(BabyVO vo){
		
		return service.selectBaby(vo);//체인지아기
	}
}
