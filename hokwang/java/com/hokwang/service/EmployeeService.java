package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MessageVO;
import com.hokwang.vo.TempmessageVO;

public interface EmployeeService {
	
	public EmployeeVO getEmp(EmployeeVO emp_vo); //로그인조회
	public int getCountMsg(EmployeeVO vo);
	public int getTotalCountMsg(EmployeeVO vo);
	public int sendCountMsg(EmployeeVO vo);
	public int tempCountMsg(EmployeeVO vo);
	public void updateInf(EmployeeVO vo);
	public List<MessageVO> showNotReadMsg(EmployeeVO vo);
	public EmployeeVO findId(EmployeeVO emp_vo); //Id찾기
	public EmployeeVO findPw(EmployeeVO emp_vo); //Pw찾기
	public List<MessageVO> getTotalMsg(EmployeeVO vo);
	public List<MessageVO> noReadTotalMsg(EmployeeVO vo);
	public List<MessageVO> sendTotalMsg(EmployeeVO vo);
	public List<EmployeeVO> selectEmpInf(EmployeeVO vo);
	public void sendMsgInf(MessageVO vo);
	public void tempMsgInf(TempmessageVO vo);
	public TempmessageVO checkTemp(TempmessageVO vo); 
	public int updateUser(EmployeeVO vo); //이미지
	public List<MessageVO> sendTotalInf(EmployeeVO vo);
	public List<TempmessageVO> tempTotalMsg(EmployeeVO vo);
	public MessageVO checkFinal(MessageVO vo); 
	public void updateYn(MessageVO vo);
	public TempmessageVO checkTempFinal(TempmessageVO vo);
	

	
}
