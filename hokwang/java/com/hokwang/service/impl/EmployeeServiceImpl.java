package com.hokwang.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.EmployeeMapper;
import com.hokwang.service.EmployeeService;
import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MessageVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	EmployeeMapper EmpDAO;

	@Override
	public EmployeeVO getEmp(EmployeeVO emp_vo) {

		return EmpDAO.getEmp(emp_vo);
	}

	@Override
	public int getCountMsg(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return EmpDAO.getCountMsg(vo);
	}

}
