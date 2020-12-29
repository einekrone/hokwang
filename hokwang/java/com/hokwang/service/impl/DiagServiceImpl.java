package com.hokwang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.hokwang.service.DiagService;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

public class DiagServiceImpl implements DiagService{

	@Autowired
	DiagService service;
	
	@Override
	public Map<String, Object> getInfoList() {
		return service.getInfoList();
	}

	@Override
	public List<Map<String, Object>> getResvList(ResvSearch vo) {

		return service.getResvList(vo);
	}

	@Override
	public List<Map<String, Object>> getResvHistList(Reservation vo) {
		return service.getResvHistList(vo);
	}

	@Override
	public Map<String, Object> getUniqInfo(Reservation vo) {
		return service.getUniqInfo(vo);
	}

}
