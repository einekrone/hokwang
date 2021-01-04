package com.hokwang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.ScheMapper;
import com.hokwang.service.ScheService;
import com.hokwang.vo.ManagementVO;

@Service
public class ScheServiceImpl implements ScheService  {
	@Autowired
	ScheMapper dao;

	@Override
	public List<ManagementVO> getScheList(ManagementVO sche) {
		// TODO Auto-generated method stub
		return dao.getScheList(sche);
	}

	@Override
	public int insertSche(ManagementVO sche) {
		// TODO Auto-generated method stub
		return dao.insertSche(sche);
	}

	@Override
	public void deleteSche(ManagementVO sche) {
		// TODO Auto-generated method stub
		dao.deleteSche(sche);
	}
	

}
