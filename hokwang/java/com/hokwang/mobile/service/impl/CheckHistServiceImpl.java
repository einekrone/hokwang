package com.hokwang.mobile.service.impl;

import java.util.List;

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
	public List<CheckHistVO> checkHistlist(BabyVO vo){// 전체 접종 리스트
		return dao.checkHistlist(vo);
	}
	
}
