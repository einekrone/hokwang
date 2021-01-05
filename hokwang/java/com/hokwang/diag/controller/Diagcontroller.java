package com.hokwang.diag.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.dao.DiagMapper;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.BodyVO;
import com.hokwang.vo.DiagnosisVO;
import com.hokwang.vo.DiesSearch;
import com.hokwang.vo.DiseaseVO;
import com.hokwang.vo.MedicineVO;
import com.hokwang.vo.PrescriptionVO;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

@Controller
public class Diagcontroller {
	@Autowired
	DiagMapper diagDao;
	
	// 페이지이동하는
	@RequestMapping("/diagnosis")
	public ModelAndView diagForm(BabyVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("diagnosis");
		return mav;
	}

	// 대기환자 리스트
	@ResponseBody
	@RequestMapping("/ajax/waitList")
	public List<Map<String, Object>> getWaitList(ResvSearch vo) {
		return diagDao.getResvList(vo);
	}

	// 선택된 환자 예약/진료 이력 리스트 조회
	@ResponseBody
	@RequestMapping("/ajax/HistoryList")
	public List<DiagnosisVO> getResvHistList(BabyVO vo) {
		return diagDao.getResvHistList(vo);
	}
	
	//선택된 환자 정보 출력
	@ResponseBody
	@RequestMapping("/ajax/Info")
	public Map<String, Object> getInfoList(Reservation vo) {
		return diagDao.getInfoList(vo);
	}

	// 선택된 환자 특이사항 정보
	@ResponseBody
	@RequestMapping("/ajax/MemoInfo")
	public Map<String, Object> getUniqInfo(Reservation vo) {
		return diagDao.getUniqInfo(vo);
	}
	// 선택된 환자 키/몸무게 정보
	@ResponseBody
	@RequestMapping("/ajax/BodyInfo")
	public BodyVO getBodyList(BodyVO vo) {
		return diagDao.getBodyList(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/Alldiag")
	public Map<String,Object> getBodyList(PrescriptionVO PreVo,DiagnosisVO diagVo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("medicine",diagDao.getMedicine(PreVo));
		map.put("diag2",diagDao.getDiagDetail2(diagVo));
		map.put("diag1",diagDao.getDiagDetail(diagVo));
		return map;
	}
	
	 //질병검색
	@ResponseBody
	@RequestMapping("/ajax/getDisease")
	public Map<String, Object> getDisease(DiesSearch vo) {
		return diagDao.getDisease(vo);
	}

	//약품리스트
	@ResponseBody
	@RequestMapping("/ajax/getMedineList")
	public List<Map<String, Object>> getMedineList(MedicineVO vo) {
		return diagDao.getMedineList(vo);
	}
	
	//약품검색
	@ResponseBody
	@RequestMapping("/ajax/schMedicine")
	public Map<String, Object> schMedicine(DiesSearch vo) {
		return diagDao.schMedicine(vo);
	}
	
}