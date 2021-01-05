package com.hokwang.service;

import java.util.List;

import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MessageVO;

public interface EmployeeService {
	
	public EmployeeVO getEmp(EmployeeVO emp_vo); //로그인조회
	public int getCountMsg(EmployeeVO vo);
	public int getTotalCountMsg(EmployeeVO vo);
	public int sendCountMsg(EmployeeVO vo);
	public void updateInf(EmployeeVO vo);
	public List<MessageVO> showNotReadMsg(EmployeeVO vo);
	public EmployeeVO findId(EmployeeVO emp_vo); //Id찾기
	public EmployeeVO findPw(EmployeeVO emp_vo); //Pw찾기
	public List<MessageVO> getTotalMsg(EmployeeVO vo);
	public List<MessageVO> noReadTotalMsg(EmployeeVO vo);
	
}
