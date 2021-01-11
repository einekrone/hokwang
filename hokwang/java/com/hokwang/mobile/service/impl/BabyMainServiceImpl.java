
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
	public List<BabyVO> getBabyInf() {
		return dao.getBabyInf();
	}
}
