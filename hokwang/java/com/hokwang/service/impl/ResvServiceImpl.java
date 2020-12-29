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

	@Override
	public List<Map<String, Object>> getResvHistList(Reservation vo) {
		return resvDao.getResvHistList(vo);
	}

	@Override
	public Map<String, Object> getPtInfo(Reservation vo) {
		return resvDao.getPtInfo(vo);
	}

	@Override
	public Map<String, Object> getUniqInfo(Reservation vo) {
		return resvDao.getUniqInfo(vo);
	}

	@Override
	public List<Map<String, Object>> getNonPayList(ResvSearch vo) {
		return resvDao.getNonPayList(vo);
	}

	@Override
	public String imgManage(Reservation vo) {
		return resvDao.imgManage(vo);
	}
	
}
