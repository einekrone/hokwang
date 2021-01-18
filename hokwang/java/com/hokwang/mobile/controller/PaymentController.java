
package com.hokwang.mobile.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.MainHeaderService;
import com.hokwang.mobile.service.PaymentService;
import com.hokwang.vo.ParentVO;
import com.hokwang.vo.PaymentVO;
import com.hokwang.vo.Reservation;

@Controller
public class PaymentController {
	
	@Autowired PaymentService payservice;
	
	// 예약 정보(+문진표)
	@ResponseBody
	@RequestMapping("/ajax/resvInfo")
	public List<Map<String, Object>> getUnPaidList(PaymentVO vo) {
		
		return payservice.getUnPaidList(vo);
	}
	
	
	
}
