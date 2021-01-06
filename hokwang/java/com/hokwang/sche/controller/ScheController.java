package com.hokwang.sche.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.dao.ScheMapper;
import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.ManagementVO;


@Controller
public class ScheController {
	@Autowired
	ScheMapper dao;
	@RequestMapping("/schedule")
	public String schedule(Model model) {
		return "schedule";
	}
	
	//조회
	@ResponseBody
	@RequestMapping("/getScheList")
	public List<ManagementVO> getScheList(ManagementVO sche){
		return dao.getScheList(sche);
	}
	
	//등록
	@ResponseBody
	@RequestMapping(value ="/insertSche", method = RequestMethod.POST)
	public String insert(Model model, ManagementVO sche, HttpServletRequest req) {
		HttpSession session = req.getSession();

		sche.setEmp_no(((EmployeeVO)session.getAttribute("emp_vo")).getEmp_no());
		dao.insertSche(sche);
		return sche.getWork_no();
	}
	//삭제
	@ResponseBody
	@RequestMapping(value="/deleteSche", method=RequestMethod.POST)
		public boolean delete(ManagementVO sche) {
			dao.deleteSche(sche);
			return true;
		}
	
	
	
	
	
	

}
