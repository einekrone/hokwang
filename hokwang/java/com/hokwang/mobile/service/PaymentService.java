package com.hokwang.mobile.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.AlertVO;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckupVO;
import com.hokwang.vo.PaymentVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

public interface PaymentService {

	public List<Map<String,Object>> getUnPaidList(PaymentVO vo);
}
