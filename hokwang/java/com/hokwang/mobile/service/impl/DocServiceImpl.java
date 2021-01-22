package com.hokwang.mobile.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.DocMapper;
import com.hokwang.mobile.service.DocService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.Reservation;

@Service
public class DocServiceImpl implements DocService{
@Autowired DocMapper dao;
	
	@Override
	public List<Map<String, Object>> selectBaby(BabyVO vo) {
		// TODO Auto-generated method stub
		return dao.selectBaby(vo);
	}

	@Override
	public List<BabyVO> babyLists(BabyVO vo) {
		// TODO Auto-generated method stub
		return dao.babyLists(vo);
	}

	@Override
	public int updateDocStatus(Reservation vo) {
		// TODO Auto-generated method stub
		return dao.updateDocStatus(vo);
	}

}
