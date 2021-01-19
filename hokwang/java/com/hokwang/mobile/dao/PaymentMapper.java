package com.hokwang.mobile.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.ParentVO;

public interface PaymentMapper {

	public List<Map<String,Object>> getUnPaidList(ParentVO vo);
	
}
