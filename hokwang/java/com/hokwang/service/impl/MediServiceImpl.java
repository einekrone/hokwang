package com.hokwang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.MediMapper;
import com.hokwang.service.MediService;
import com.hokwang.vo.MedicineVO;

@Service
public class MediServiceImpl implements MediService {

	@Autowired
	MediMapper mediDao;

	@Override
	public List<MedicineVO> getMediList() {
		return mediDao.getMediList();
	}
	
	@Override
	public int saveMedi(MedicineVO vo) {
		return mediDao.saveMedi(vo);
	}
	
	@Override
	public MedicineVO selectMedi(MedicineVO vo) {
		return mediDao.selectMedi(vo);
	}

	@Override
	public boolean deleteMedi(MedicineVO vo) {
		mediDao.deleteMedi(vo);
		return true;
	}
	
	
	
}
