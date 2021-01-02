package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.DiagnosisVO;
import com.hokwang.vo.PrescriptionVO;
public interface PatientService {
	public List<BabyVO> allpatientList(BabyVO vo);//전체환자 리스트
	public List<DiagnosisVO> diagnosisRecord(BabyVO vo);//진료기록
	public Map<String,Object> patientInfo(BabyVO vo);//환자상세정보
	
	public List<Map<String,Object>> mediName(PrescriptionVO vo);//상세진료내역
}
