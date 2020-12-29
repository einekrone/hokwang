package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

public interface DiagService {

	public Map<String,Object> getInfoList();
	public List<Map<String, Object>> getResvList(ResvSearch vo);
	public List<Map<String, Object>> getResvHistList(Reservation vo);
	public Map<String, Object> getUniqInfo(Reservation vo);

}
