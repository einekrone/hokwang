package com.hokwang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.EmployeeMapper;
import com.hokwang.service.EmployeeService;
import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MessageVO;
import com.hokwang.vo.TempmessageVO;

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
		
		return EmpDAO.getCountMsg(vo);
	}
	
	@Override
	public int getTotalCountMsg(EmployeeVO vo) {
		
		return EmpDAO.getTotalCountMsg(vo);
	}
	
	@Override
	public int sendCountMsg(EmployeeVO vo) {
		
		return EmpDAO.sendCountMsg(vo);
	}
	
	@Override
	public int tempCountMsg(EmployeeVO vo) {
		
		return EmpDAO.tempCountMsg(vo);
	}
	
	
	@Override
	public List<EmployeeVO> selectEmpInf(EmployeeVO vo) {
		
		return EmpDAO.selectEmpInf(vo);
	}


	@Override
	public List<MessageVO> showNotReadMsg(EmployeeVO vo) {
		
		return EmpDAO.showNotReadMsg(vo);
	}

	@Override
	public EmployeeVO findId(EmployeeVO emp_vo) {
		// 아이디찾기
		return EmpDAO.findId(emp_vo);
	}

	@Override
	public EmployeeVO findPw(EmployeeVO emp_vo) {
		// 비밀번호찾기
		return EmpDAO.findPw(emp_vo);
	}
	
	
	@Override
	public int updateInf(EmployeeVO emp_vo) {
		// 비밀번호찾기
		
		return EmpDAO.updateInf(emp_vo);
	}
	
	
	@Override
	public List<MessageVO> getTotalMsg(EmployeeVO vo) {
		
		return EmpDAO.getTotalMsg(vo);
	}

	@Override
	public List<MessageVO> noReadTotalMsg(EmployeeVO vo) {
		
		return EmpDAO.noReadTotalMsg(vo);
	}
	
	@Override
	public List<MessageVO> sendTotalMsg(EmployeeVO vo) {
		
		return EmpDAO.sendTotalMsg(vo);
	}

	@Override
	public void sendMsgInf(MessageVO vo) {
		
		EmpDAO.sendMsgInf(vo);
	}
	
	@Override
	public void tempMsgInf(TempmessageVO vo) {
		
		EmpDAO.tempMsgInf(vo);
	}
	

	@Override
	public TempmessageVO checkTemp(TempmessageVO vo) {
		// 아이디찾기
		return EmpDAO.checkTemp(vo);
	}

	@Override
	public List<MessageVO> sendTotalInf(EmployeeVO vo) {
		
		return EmpDAO.sendTotalInf(vo);
	}
	
	@Override
	public List<TempmessageVO> tempTotalMsg(EmployeeVO vo) {
		
		return EmpDAO.tempTotalMsg(vo);
	}
	
	@Override
	public MessageVO checkFinal(MessageVO vo) {
		// 아이디찾기
		return EmpDAO.checkFinal(vo);
	}
	
	@Override
	public void updateYn(MessageVO vo) {
		
		EmpDAO.updateYn(vo);
	}
	
	@Override
	public TempmessageVO checkTempFinal(TempmessageVO vo) {
		// 아이디찾기
		return EmpDAO.checkTempFinal(vo);
	}

	
	@Override
	public void deleteMsg(MessageVO vo) {
		EmpDAO.deleteMsg(vo);
	}

	@Override
	public int pwdselect(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public EmployeeVO getEmpList(EmployeeVO emp_vo) {
		// TODO Auto-generated method stub
		return EmpDAO.getEmpList(emp_vo);
	}

	@Override
	public void updateImg(EmployeeVO vo) {
		// TODO Auto-generated method stub
		EmpDAO.updateImg(vo);
	}

	@Override
	public EmployeeVO selectempl(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return EmpDAO.selectempl(vo);
	}

	@Override
	public Integer getCountResv(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return EmpDAO.getCountResv(vo);
	}

	@Override
	public Integer getDaySales(EmployeeVO vo) {
		// TODO Auto-generated method stub
		return EmpDAO.getDaySales(vo);
	}
	
	
}