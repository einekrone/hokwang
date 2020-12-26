package com.hokwang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.PatientMapper;
import com.hokwang.service.PatientService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.DiagnosisVO;

@Service
public class PatientServiceImpl implements PatientService {
	@Autowired PatientMapper patientDAO;
	
	@Override
	public List<Map<String, Object>> getPatientList(BabyVO vo) {
		
		return patientDAO.getPatientList(vo);
	}

	@Override
	public List<Map<String, Object>> diagnosisRecord(DiagnosisVO vo) {
		return patientDAO.diagnosisRecord(vo);
	}

}
