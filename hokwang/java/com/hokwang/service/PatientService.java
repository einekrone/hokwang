package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.DiagnosisVO;
public interface PatientService {
	public List<BabyVO> allpatientList(BabyVO vo);//전체환자 리스트
	public List<DiagnosisVO> diagnosisRecord(BabyVO vo);//진료기록
	public List<Map<String,Object>> patientInfo(BabyVO vo);//환자상세정보
}
