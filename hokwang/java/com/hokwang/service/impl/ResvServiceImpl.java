package com.hokwang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.dao.ResvMapper;
import com.hokwang.service.ResvService;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

@Service
public class ResvServiceImpl implements ResvService {

	@Autowired
	ResvMapper resvDao;

	@Override
	public List<Map<String, Object>> getResvList(ResvSearch vo) {
		return resvDao.getResvList(vo);
	}
	
}