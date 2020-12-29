package com.hokwang.service;

import java.util.List;

import com.hokwang.vo.MedicineVO;

public interface MediService {
	public List<MedicineVO> getMediList();
	public int saveMedi(MedicineVO vo);
	public MedicineVO selectMedi(MedicineVO vo);
}
