package com.hokwang.service.impl;

import java.util.List;

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
	public void updateInf(EmployeeVO emp_vo) {
		// 비밀번호찾기
		EmpDAO.updateInf(emp_vo);
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
	
	
	
	
}
