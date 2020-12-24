package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;

public interface PatientService {
	public List<Map<String, Object>> AllpatientList(BabyVO vo);

}
