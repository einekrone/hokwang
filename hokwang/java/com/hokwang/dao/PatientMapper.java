package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.DiagnosisVO;

public interface PatientMapper {
	
	public List<Map<String, Object>> getPatientList(BabyVO vo);//전체 환자 리스트
	public List<Map<String,Object>> diagnosisRecord(DiagnosisVO vo);//진료기록
}
