package com.hokwang.pati.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.service.PatientService;
import com.hokwang.service.impl.PatientServiceImpl;
import com.hokwang.vo.BabyVO;

@Controller
public class PatientController {
	@Autowired PatientService patientDAO;
	/*
	 * @GetMapping("/patient") public ModelAndView createForm(){ ModelAndView mv =
	 * new ModelAndView(); mv.setViewName("patient"); mv.addObject("id", "이름여기들어감");
	 * 
	 * return mv; }
	 */
	@RequestMapping("/patient") //.do 같은거 //페이지이동
	public ModelAndView patientForm(BabyVO vo){
	  ModelAndView mav=new ModelAndView();
	  //mav.addObject("vo",patientDAO.AllpatientList(vo));
	  mav.setViewName("patient");
	  return mav;//jsp경로
	}
	@ResponseBody
	@RequestMapping("ajax/patientList")
	public List<Map<String,Object>> patientList(BabyVO vo,HttpServletRequest request){
		System.out.println(request.getParameter("baby_no"));
		System.out.println(request.getParameter("baby_name"));
		System.out.println(request.getParameter("baby_regno1"));
		System.out.println(request.getParameter("baby_gender"));
		System.out.println("service->여기 불러옴");
		return patientDAO.AllpatientList(vo);
		
	}
}
