package com.hokwang.mobile.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.EmployeemMapper;
import com.hokwang.mobile.service.EmployeemService;
import com.hokwang.vo.EmployeeVO;

@Service
public class EmployeemServiceImpl implements EmployeemService {
	@Autowired
	EmployeemMapper dao;
	
	@Override
	public List<EmployeeVO> getEmpInfo() {
		//의사소개
		return dao.getEmpInfo();
	}
}
