
package com.hokwang.mobile.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.PaymentService;
import com.hokwang.mobile.service.ResvmService;
import com.hokwang.vo.ParentVO;
import com.hokwang.vo.PaymentVO;


@Controller
public class PaymentController {
	
	@Autowired PaymentService payservice;

	//결제완료 리스트
	@ResponseBody
	@RequestMapping(value = "/ajax/getUnPaidList")
	public List<Map<String, Object>> getUnPaidList(ParentVO vo, HttpSession session) {
		System.out.println(">> "+vo.getParent_no());
		session.getAttribute("parent_vo");
		return payservice.getUnPaidList(vo);
	}
	
		//계좌이체 
		@ResponseBody
		@RequestMapping(value = "/ajax/updateAccount")
		public int updateAccount(PaymentVO vo) {

			return payservice.updateAccount(vo);
		}
	
		//카드결제 선택
		@ResponseBody
		@RequestMapping(value = "/ajax/updatePayment")
		public int updatePayment(PaymentVO vo) {

			return payservice.updatePayment(vo);
		}
	
}
