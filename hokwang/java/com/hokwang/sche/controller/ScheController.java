package com.hokwang.sche.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.dao.ScheMapper;
import com.hokwang.vo.ManagementVO;


@Controller
public class ScheController {
	@Autowired
	ScheMapper dao;
	@RequestMapping("/schedule")
	public String schedule(Model model) {
		return "schedule";
	}
	
	
	@ResponseBody
	@RequestMapping("/getScheList")
	public List<ManagementVO> getScheList(ManagementVO sche){
		return dao.getScheList(sche);
	}
	
	
	
	
	

}
