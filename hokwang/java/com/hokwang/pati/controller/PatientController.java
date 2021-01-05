package com.hokwang.pati.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hokwang.service.PatientService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.BodyVO;
import com.hokwang.vo.DiagnosisVO;
import com.hokwang.vo.PrescriptionVO;

@org.springframework.stereotype.Controller
public class PatientController {
	@Autowired PatientService patientService;
	/*
	 * @GetMapping("/patient") public ModelAndView createForm(){ ModelAndView mv =
	 * new ModelAndView(); mv.setViewName("patient"); mv.addObject("id", "이름여기들어감");
	 * 
	 * return mv; }
	 */
	@RequestMapping("/patient") //.do 같은거 //페이지이동
	public ModelAndView createForm(Model model){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("patient");
		return mav;
	}
	
	@ResponseBody//전체 환자 리스트 요청 메소드
	@RequestMapping("ajax/patientList")
	public List<BabyVO> allpatientList(BabyVO vo){
		return patientService.allpatientList(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/diagDetailAndInfo")
	public Map<String,Object> diagnosisAndInfo(BabyVO vo,BodyVO vo2) { //환자정보/진료기록//차트
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("patientInfo",patientService.patientInfo(vo));
		map.put("diagnosisRecord",patientService.diagnosisRecord(vo));
		map.put("chart",patientService.bodyInfo(vo2));
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/diagDetail")
	public Map<String,Object> getDiagList(PrescriptionVO PreVo,DiagnosisVO diagVo) {
		Map<String,Object> map = new HashMap<String,Object>(); //상세진료기록
		map.put("medicine",patientService.mediName(PreVo));
		map.put("diag2",patientService.diagDetail1(diagVo));
		map.put("diag3",patientService.diagDetail2(diagVo));
		return map;
	}
	
}
