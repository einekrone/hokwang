package com.hokwang.mobile.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.PaymentVO;

public interface PaymentMapper {

	public List<Map<String,Object>> getUnPaidList(PaymentVO vo);
	
}
