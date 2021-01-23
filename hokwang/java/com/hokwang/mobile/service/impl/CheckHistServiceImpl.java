package com.hokwang.mobile.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.CheckHistMapper;
import com.hokwang.mobile.service.CheckHistService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckHistVO;
@Service
public class CheckHistServiceImpl implements CheckHistService {
	@Autowired CheckHistMapper dao;

	@Override
	public List<Map<String,Object>> checkHistlist(BabyVO vo){// 전체 접종 리스트{// 전체 접종 리스트
		return dao.checkHistlist(vo);
	}

	@Override
	public List<Map<String, Object>> checkHistlistIncomplete(BabyVO vo) {
		// TODO Auto-generated method stub
		return dao.checkHistlistIncomplete(vo);
	}

	@Override
	public List<Map<String, Object>> checkHistlistComplete(BabyVO vo) {
		// TODO Auto-generated method stub
		return dao.checkHistlistComplete(vo);
	}
	
}
