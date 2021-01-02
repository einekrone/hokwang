package com.hokwang.dao;

import java.util.List;

import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MessageVO;

public interface EmployeeMapper {

	public EmployeeVO getEmp(EmployeeVO emp_vo); //로그인조회
	public int getCountMsg(EmployeeVO emp_vo); //로그인조회
	public List<MessageVO> showNotReadMsg(EmployeeVO emp_vo);
}

