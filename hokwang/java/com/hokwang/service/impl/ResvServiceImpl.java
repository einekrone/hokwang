package com.hokwang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.hokwang.dao.ResvMapper;
import com.hokwang.service.ResvService;
import com.hokwang.vo.Reservation;

public class ResvServiceImpl implements ResvService {

	@Autowired
	ResvMapper resvDao;

	@Override
	public List<Map<String, Object>> getResvList() {
		return resvDao.getResvList();
	}
	
}
