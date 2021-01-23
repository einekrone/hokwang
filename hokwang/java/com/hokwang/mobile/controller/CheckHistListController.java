package com.hokwang.mobile.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.CheckHistService;
import com.hokwang.vo.BabyVO;

@Controller
public class CheckHistListController {
@Autowired CheckHistService service;

	@ResponseBody
	@RequestMapping("/ajax/checkhist")
	public Map<String,Object> checkHistlist(BabyVO vo){// 전체 접종 리스트
		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("checkhistlist",service.checkHistlist(vo));
		map.put("checkhistIncom",service.checkHistlistIncomplete(vo));
		map.put("checkCom",service.checkHistlistComplete(vo));
		return map;//접종 
	}
}
