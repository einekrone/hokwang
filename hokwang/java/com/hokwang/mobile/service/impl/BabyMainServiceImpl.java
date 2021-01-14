
package com.hokwang.mobile.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.BabyMainMapper;
import com.hokwang.mobile.service.BabyMainService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.ParentVO;

@Service
public class BabyMainServiceImpl implements BabyMainService {
	@Autowired
	BabyMainMapper dao;
	
	@Override
	public List<BabyVO> getBabyInf(BabyVO vo) {
		return dao.getBabyInf(vo);
	}

	@Override
	public int insertbabyinfo(BabyVO vo) {
		return dao.insertbabyinfo(vo);
	}
	@Override
	public int updatebabyinfo(BabyVO vo) {
		return dao.updatebabyinfo(vo);
	}

	@Override
	public BabyVO getInfo(BabyVO vo) {
		return dao.getInfo(vo);
	}

	
}
