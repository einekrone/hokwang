package com.hokwang.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.CheckHistService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckHistVO;

@Controller
public class CheckHistListController {
@Autowired CheckHistService service;

	@ResponseBody
	@RequestMapping("/ajax/checkhist")
	public List<CheckHistVO> checkHistlist(BabyVO vo) {
		return service.checkHistlist(vo);
	}
}
