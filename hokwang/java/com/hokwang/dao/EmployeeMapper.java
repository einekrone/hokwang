package com.hokwang.dao;

import java.util.List;

import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MessageVO;
import com.hokwang.vo.TempmessageVO;

public interface EmployeeMapper {

	public EmployeeVO getEmp(EmployeeVO emp_vo); //로그인조회
	public int getCountMsg(EmployeeVO emp_vo);
	public int getTotalCountMsg(EmployeeVO emp_vo);
	public int sendCountMsg(EmployeeVO emp_vo);
	public int tempCountMsg(EmployeeVO emp_vo);
	public void updateInf(EmployeeVO emp_vo);
	public List<MessageVO> showNotReadMsg(EmployeeVO emp_vo);
	public EmployeeVO findId(EmployeeVO emp_vo); //Id찾기
	public EmployeeVO findPw(EmployeeVO emp_vo); //Pw찾기
	public List<MessageVO> getTotalMsg(EmployeeVO emp_vo);
	public List<MessageVO> noReadTotalMsg(EmployeeVO emp_vo);
	public List<MessageVO> sendTotalMsg(EmployeeVO emp_vo);
	public List<EmployeeVO> selectEmpInf(EmployeeVO emp_vo);
	public void sendMsgInf(MessageVO vo);
	public void tempMsgInf(TempmessageVO vo);
	public TempmessageVO checkTemp(TempmessageVO vo); //Id찾기
	public int updateUser(EmployeeVO vo); //이미지 수정
}

