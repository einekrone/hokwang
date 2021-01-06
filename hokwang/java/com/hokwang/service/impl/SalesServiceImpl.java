package com.hokwang.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.SaleMapper;
import com.hokwang.service.SalesService;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	SaleMapper salesDao;

	
	@Override
	public Integer getDaySales() {
		// TODO Auto-generated method stub
		return salesDao.getDaySales();
	}
	
	@Override
	public Integer getMonthSales() {
		// TODO Auto-generated method stub
		return salesDao.getMonthSales();
	}
	
	@Override
	public Integer getYearSales() {
		// TODO Auto-generated method stub
		return salesDao.getYearSales();
	}
	
	@Override
	public Integer getCountResv() {
		// TODO Auto-generated method stub
		return salesDao.getCountResv();
	}
	
	
}
