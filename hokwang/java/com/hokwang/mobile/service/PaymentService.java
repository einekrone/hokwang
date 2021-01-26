package com.hokwang.mobile.service;

import java.util.List;
import java.util.Map;


import com.hokwang.vo.ParentVO;
import com.hokwang.vo.PaymentVO;

public interface PaymentService {

	public List<Map<String,Object>> getUnPaidList(ParentVO vo);
	public void CheckProcedure(ParentVO vo);
	
	public int updateAccount(PaymentVO vo);
	public int updatePayment(PaymentVO vo);
	
}
