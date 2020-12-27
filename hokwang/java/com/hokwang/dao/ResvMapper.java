package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

public interface ResvMapper {

	public List<Map<String, Object>> getResvList(ResvSearch vo);
	public List<Map<String, Object>> getResvHistList(Reservation vo);
	public Map<String, Object> getPtInfo(Reservation vo);
}
