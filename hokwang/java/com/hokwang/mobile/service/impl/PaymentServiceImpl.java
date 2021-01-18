package com.hokwang.mobile.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.PaymentMapper;
import com.hokwang.mobile.service.PaymentService;
import com.hokwang.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired PaymentMapper paydao;
	
	@Override
	public List<Map<String, Object>> getUnPaidList(PaymentVO vo) {
		return paydao.getUnPaidList(vo);
	}

}
