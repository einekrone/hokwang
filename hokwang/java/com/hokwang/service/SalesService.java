package com.hokwang.service;

import java.util.Map;

import com.hokwang.vo.PaymentVO;

public interface SalesService {	
	public Integer getDaySales();
	public Integer getMonthSales();
	public Integer getYearSales();
	public Integer getCountResv();
	public Integer getMonth1();
}
