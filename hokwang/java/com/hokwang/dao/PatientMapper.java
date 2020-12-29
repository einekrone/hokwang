package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.DiagnosisVO;

public interface PatientMapper {
	
	public List<BabyVO> allpatientList(BabyVO vo);//전체 환자 리스트
	public List<DiagnosisVO> diagnosisRecord(BabyVO vo);//진료기록
	public List<Map<String,Object>> patientInfo(BabyVO vo);
}
