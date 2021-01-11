package com.hokwang.mobile.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.ResvmService;
import com.hokwang.vo.ParentVO;

@Controller
public class ResvmController {
	@Autowired
	ResvmService resvmSvc;

	// 예약 자녀 리스트
	@ResponseBody
	@RequestMapping("/ajax/childList")
	public List<Map<String, Object>> getChildList(ParentVO vo) {
		return resvmSvc.getChildList(vo);
	} 
}
