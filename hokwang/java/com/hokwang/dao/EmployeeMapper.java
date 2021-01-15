package com.hokwang.dao;

import java.util.List;

import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MessageVO;
import com.hokwang.vo.TempmessageVO;

public interface EmployeeMapper {

	public EmployeeVO getEmpList(EmployeeVO emp_vo); // 로그인조회

	public EmployeeVO getEmp(EmployeeVO emp_vo); // 로그인조회

	public EmployeeVO findId(EmployeeVO emp_vo); // Id찾기
	
	public EmployeeVO findPw(EmployeeVO emp_vo); // Pw찾기
	
	public int updateInf(EmployeeVO emp_vo);// 비밀번호 수정
	
	public void updateImg(EmployeeVO vo); // 이미지 수정
	
	public Integer getCountResv(EmployeeVO vo); //각진료실 예약건수
	
	public Integer getDaySales(EmployeeVO vo); //각진료실매출
	
	public int getCountMsg(EmployeeVO emp_vo);

	public int getTotalCountMsg(EmployeeVO emp_vo);

	public int sendCountMsg(EmployeeVO emp_vo);

	public int tempCountMsg(EmployeeVO emp_vo);


	public List<MessageVO> showNotReadMsg(EmployeeVO emp_vo);

	public List<MessageVO> getTotalMsg(EmployeeVO emp_vo);

	public List<MessageVO> noReadTotalMsg(EmployeeVO emp_vo);

	public List<MessageVO> sendTotalMsg(EmployeeVO emp_vo);

	public List<EmployeeVO> selectEmpInf(EmployeeVO emp_vo);

	public void sendMsgInf(MessageVO vo);

	public void tempMsgInf(TempmessageVO vo);

	public TempmessageVO checkTemp(TempmessageVO vo);

	public List<MessageVO> sendTotalInf(EmployeeVO vo);

	public List<TempmessageVO> tempTotalMsg(EmployeeVO vo);

	public MessageVO checkFinal(MessageVO vo);

	public void updateYn(MessageVO vo);

	public TempmessageVO checkTempFinal(TempmessageVO vo);

	public void deleteMsg(MessageVO vo);
	
	public EmployeeVO selectempl(EmployeeVO vo);
	

}