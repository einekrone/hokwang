package com.hokwang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.PatientMapper;
import com.hokwang.service.PatientService;
import com.hokwang.vo.BabyVO;
@Service("patientService")
public class PatientServiceImpl implements PatientService{
	@Autowired  PatientMapper patientDAO;
	
	
	@Override
	public List<Map<String, Object>> AllpatientList(BabyVO vo) {
		System.out.println("전체환자 리스트 call");
		
		return patientDAO.AllpatientList(vo);
	}

}
