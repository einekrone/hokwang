package com.hokwang.sche.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

	// 조회
	@ResponseBody
	@RequestMapping("/getScheList")
	public List<Map<String, Object>> getScheList(ManagementVO sche, HttpServletRequest req) {
		HttpSession session = req.getSession();

		sche.setEmp_author(((EmployeeVO) session.getAttribute("emp_vo")).getEmp_author());
		return dao.getScheList(sche);
	}

	// 등록
	@ResponseBody
	@RequestMapping(value = "/insertSche", method = RequestMethod.POST)
	public String insert(Model model, ManagementVO sche, HttpServletRequest req) {
		HttpSession session = req.getSession();

		sche.setEmp_no(((EmployeeVO) session.getAttribute("emp_vo")).getEmp_no());
		dao.insertSche(sche);
		return sche.getWork_no();
	}

	// 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteSche", method = RequestMethod.POST)
	public boolean delete(ManagementVO sche) {
		dao.deleteSche(sche);
		return true;
	}

	// 엑셀 저장(export)
	@RequestMapping("/schExcelView")
	public ModelAndView excelView(ManagementVO sche,HttpServletResponse response, HttpServletRequest req) throws IOException {
		HttpSession session = req.getSession();

		sche.setEmp_author(((EmployeeVO) session.getAttribute("emp_vo")).getEmp_author());
		List<Map<String, Object>> list = dao.getScheList(sche);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String[] header = { "적용색상", "시작일", "종료일", "사원번호", "내용" };
		map.put("headers", header);
		map.put("filename", "sch");
		map.put("datas", list);
		return new ModelAndView("excelView", map);
	}

}
