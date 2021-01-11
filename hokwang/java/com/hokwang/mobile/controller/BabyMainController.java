
package com.hokwang.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.BabyMainService;
import com.hokwang.vo.BabyVO;

@Controller
public class BabyMainController {
	@Autowired
	BabyMainService dao;
	
	//의사 조회
	@ResponseBody
	@RequestMapping("/ajax/getBabyInf")
	public List<BabyVO> getBabyInf() {
		return dao.getBabyInf();
	}
	
	
}
