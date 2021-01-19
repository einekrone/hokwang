package com.hokwang.mobile.service;

import java.util.List;
import java.util.Map;


import com.hokwang.vo.ParentVO;

public interface PaymentService {

	public List<Map<String,Object>> getUnPaidList(ParentVO vo);
}
