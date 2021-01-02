package com.hokwang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.PatientMapper;
import com.hokwang.service.PatientService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.DiagnosisVO;
import com.hokwang.vo.PrescriptionVO;

@Service
public class PatientServiceImpl implements PatientService {
	@Autowired PatientMapper patientDAO;
	
	@Override
	public List<BabyVO> allpatientList(BabyVO vo) {//전체 환자
		
		return patientDAO.allpatientList(vo);
	}

	@Override
	public List<DiagnosisVO> diagnosisRecord(BabyVO vo) {//진료기록
		// TODO Auto-generated method stub
		return patientDAO.diagnosisRecord(vo);
	}

	@Override
	public Map<String, Object> patientInfo(BabyVO vo) {//환자상세정보
		// TODO Auto-generated method stub
		return patientDAO.patientInfo(vo);
	}

	@Override
	public List<Map<String, Object>> mediName(PrescriptionVO vo) {//상세진료 약이름
		// TODO Auto-generated method stub
		return patientDAO.mediName(vo);
	}

	@Override
	public Map<String, Object> diagDetail1(DiagnosisVO vo) {//상세진료내역
		// TODO Auto-generated method stub
		return patientDAO.diagDetail1(vo);
	}

	@Override
	public Map<String, Object> diagDetail2(DiagnosisVO vo) {
		// TODO Auto-generated method stub
		return patientDAO.diagDetail2(vo);
	}



}
