
package com.hokwang.mobile.service.impl;

import java.util.List;
import java.util.Map;

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
	public void kakaoRegisterAction(ParentVO vo) {
		dao.kakaoRegisterAction(vo);
	}
	
	@Override
	public int alertCntAction(ParentVO vo) {
		// TODO Auto-generated method stub
		return dao.alertCntAction(vo);
	}
	
	@Override
	public ParentVO checkId(ParentVO vo) {
		return dao.checkId(vo);
	}
	
	@Override
	public ParentVO checkEmail(ParentVO vo) {
		return dao.checkEmail(vo);
	}

	@Override
	public List<Map<String, Object>> alertInf(ParentVO vo) {
		// TODO Auto-generated method stub
		return dao.alertInf(vo);
	}
	
}
