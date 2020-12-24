package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

public interface ResvService {

	public List<Map<String, Object>> getResvList(ResvSearch vo);
	public List<Map<String, Object>> getResvHistList(Reservation vo);
}
