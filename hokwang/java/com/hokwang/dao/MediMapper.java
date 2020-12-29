package com.hokwang.dao;

import java.util.List;

import com.hokwang.vo.MedicineVO;

public interface MediMapper {

	public List<MedicineVO> getMediList();
	public int saveMedi(MedicineVO vo);
	public MedicineVO selectMedi(MedicineVO vo);
}
