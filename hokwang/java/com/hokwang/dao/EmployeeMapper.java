package com.hokwang.dao;

import com.hokwang.vo.EmployeeVO;

public interface EmployeeMapper {

	public EmployeeVO getEmp(EmployeeVO emp_vo); //로그인조회
	public int getCountMsg(EmployeeVO emp_vo); //로그인조회

}

