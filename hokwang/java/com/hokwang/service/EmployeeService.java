package com.hokwang.service;

import com.hokwang.vo.EmployeeVO;

public interface EmployeeService {
	
	public EmployeeVO getEmp(EmployeeVO emp_vo); //로그인조회
	public int getCountMsg(EmployeeVO vo);

}
