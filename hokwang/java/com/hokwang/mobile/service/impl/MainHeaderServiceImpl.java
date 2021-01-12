
package com.hokwang.mobile.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.MainHeaderMapper;
import com.hokwang.mobile.service.MainHeaderService;
import com.hokwang.vo.ParentVO;

@Service
public class MainHeaderServiceImpl implements MainHeaderService {
	@Autowired
	MainHeaderMapper dao;
	
	@Override
	public ParentVO logInAction(ParentVO vo) {
		return dao.logInAction(vo);
	}

	@Override
	public void registerAction(ParentVO vo) {
		dao.registerAction(vo);
	}

	@Override
	public int alertCntAction(ParentVO vo) {
		// TODO Auto-generated method stub
		return dao.alertCntAction(vo);
	}
	
	
}
