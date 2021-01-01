package com.hokwang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.SaleMapper;
import com.hokwang.service.SalesService;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	SaleMapper salesDao;

	
	@Override
	public int getDaySales() {
		// TODO Auto-generated method stub
		return salesDao.getDaySales();
	}
	
	@Override
	public int getMonthSales() {
		// TODO Auto-generated method stub
		return salesDao.getMonthSales();
	}
	
	@Override
	public int getYearSales() {
		// TODO Auto-generated method stub
		return salesDao.getYearSales();
	}
	
	@Override
	public int getCountResv() {
		// TODO Auto-generated method stub
		return salesDao.getCountResv();
	}
	
	
}
