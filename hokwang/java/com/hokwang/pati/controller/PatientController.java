package com.hokwang.pati.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.service.PatientService;
import com.hokwang.vo.BabyVO;
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
	@RequestMapping("/ajax/diagnosisRecord")//진료기록
	public List<DiagnosisVO> diagnosisRecord(BabyVO vo){
		return patientService.diagnosisRecord(vo);
	}
	
	@ResponseBody
	@RequestMapping("/ajax/patientInfo")//상세환자정보
	public Map<String, Object> patientInfo(BabyVO vo) {
		return patientService.patientInfo(vo);
	}
	
	@ResponseBody
	@RequestMapping("/ajax/dignosisDetail")//진료 약이름상세
	public Map<String,Object> mediName(PrescriptionVO vo){
		return patientService.mediName(vo);
	}
}
