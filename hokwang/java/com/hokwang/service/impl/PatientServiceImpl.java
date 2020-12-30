package com.hokwang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.PatientMapper;
import com.hokwang.service.PatientService;
import com.hokwang.vo.BabyJoinToDiagnosisVOAndReser;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.DiagnosisVO;
import com.hokwang.vo.PrescriptionVO;

@Service
public class PatientServiceImpl implements PatientService {
	@Autowired PatientMapper patientDAO;
	
	@Override
	public List<BabyVO> allpatientList(BabyVO vo) {
		
		return patientDAO.allpatientList(vo);
	}

	@Override
	public List<DiagnosisVO> diagnosisRecord(BabyVO vo) {
		// TODO Auto-generated method stub
		return patientDAO.diagnosisRecord(vo);
	}

	@Override
	public Map<String, Object> patientInfo(BabyVO vo) {//환자상세정보
		// TODO Auto-generated method stub
		return patientDAO.patientInfo(vo);
	}

	@Override
	public Map<String, Object> mediName(PrescriptionVO vo) {
		
		return patientDAO.mediName(vo);
	}

}
