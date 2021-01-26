package com.hokwang.mobile.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.PaymentMapper;
import com.hokwang.mobile.service.PaymentService;
import com.hokwang.vo.ParentVO;
import com.hokwang.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired PaymentMapper paydao;
	
	@Override
	public List<Map<String, Object>> getUnPaidList(ParentVO vo) {
		return paydao.getUnPaidList(vo);
	}

	@Override
	public void CheckProcedure(ParentVO vo) {
		paydao.CheckProcedure(vo);
		
	}

	@Override
	public int updateAccount(PaymentVO vo) {
		
		return paydao.updateAccount(vo);
	}

	@Override
	public int updatePayment(PaymentVO vo) {

		return paydao.updatePayment(vo);
	}

	@Override
	public int reservationPayW(PaymentVO vo) {
		// TODO Auto-generated method stub
		return paydao.reservationPayW(vo);
	}

	@Override
	public int reservationPayY(PaymentVO vo) {
		// TODO Auto-generated method stub
		return paydao.reservationPayW(vo);
	}

}
