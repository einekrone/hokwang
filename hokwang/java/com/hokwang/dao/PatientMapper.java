package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.DiagnosisVO;
import com.hokwang.vo.PrescriptionVO;

public interface PatientMapper {
	
	public List<BabyVO> allpatientList(BabyVO vo);//전체 환자 리스트
	public List<DiagnosisVO> diagnosisRecord(BabyVO vo);//진료기록
	public Map<String,Object> patientInfo(BabyVO vo);//상세환자정보
	public Map<String,Object> mediName(PrescriptionVO vo);//상세진료 약이름내역
}
