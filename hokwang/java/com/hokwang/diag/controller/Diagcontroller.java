package com.hokwang.diag.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.service.DiagService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.BodyVO;
import com.hokwang.vo.CheckupVO;
import com.hokwang.vo.DiagnosisVO;
import com.hokwang.vo.DiseaseVO;
import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MedicineVO;
import com.hokwang.vo.PrescriptionVO;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

@Controller
public class Diagcontroller {
	@Autowired
	DiagService diagDao;
	
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
	public List<Map<String, Object>> getWaitList(EmployeeVO vo) {
		System.out.println(vo.getEmp_room());
		return diagDao.getResvList(vo);
	}

	// 선택된 환자 예약/진료 이력 리스트 조회
	@ResponseBody
	@RequestMapping("/ajax/HistoryList")
	public List<Map<String, Object>> getResvHistList(BabyVO vo) {
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
	
	 //질병리스트
	@ResponseBody
	@RequestMapping("/ajax/getDisease")
	public List<DiseaseVO> getDisease(DiseaseVO vo) {
		return diagDao.getDisease(vo);
	}

	//약품리스트
	@ResponseBody
	@RequestMapping("/ajax/getMedineList")
	public List<MedicineVO> getMedineList(MedicineVO vo) {
		return diagDao.getMedineList(vo);
	}
	
	//처방전 인설트
	@ResponseBody
	@RequestMapping("/ajax/insertPres")
	public int insertPres(PrescriptionVO vo) {
	return diagDao.insertPres(vo);
	}
	
	
	//처방전 뿌려줌
	@ResponseBody
	@RequestMapping("/ajax/getPrescription")
	public List<PrescriptionVO> getPrescription(PrescriptionVO vo) {
		System.out.println(vo.getResv_no());
	return diagDao.getPrescription(vo);
	}
	
	//처방전 수정
	@ResponseBody
	@RequestMapping("/ajax/updatePrescription")
	public int updatePrescription(PrescriptionVO vo){
	System.out.println(vo);	
	return diagDao.updatePrescription(vo);
	}
	
	//처방전 삭제
	@ResponseBody
	@RequestMapping("/ajax/deletePrescription")
	public int deletePrescription(PrescriptionVO vo){
	System.out.println(vo);	
	return diagDao.deletePrescription(vo);
	}
	
	
	  //진단서 인설트
	  @ResponseBody  
	  @RequestMapping("/ajax/insertDiagList") 
	  public int insertDiagList(DiagnosisVO vo){
	  return diagDao.insertDiagList(vo); 
	  }
	  
	  //진료종료 / 시작시 예약 상태값 변경
	  @ResponseBody  
	  @RequestMapping("/ajax/UpdateDiagStatus") 
	  public int UpdateDiagStatus(Reservation vo){
	  return diagDao.UpdateDiagStatus(vo); 
	  }
	  
	  //예방접종 리스트 뿌려줌
	  @ResponseBody  
	  @RequestMapping("/ajax/getInjection") 
	  public List<Map<String, Object>> getInjection(Reservation vo){
	  return diagDao.getInjection(vo); 
	  }
	  
	  
	
}