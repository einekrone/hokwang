package com.hokwang.mobile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.service.EmployeeService;
import com.hokwang.vo.EmployeeVO;

@Controller
public class MainController {
	@Autowired
	EmployeeService dao;
	
	//의사 조회
	@ResponseBody
	@RequestMapping("/ajax/getEmpInfo")
	public List<EmployeeVO> getEmpInfo() {
		return dao.getEmpInfo();
	}
	

}
