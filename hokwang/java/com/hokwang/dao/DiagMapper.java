package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BodyVO;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;


public interface DiagMapper {
	
	public Map<String,Object> getInfoList(Reservation vo);
	public List<Map<String, Object>> getResvList(ResvSearch vo);
	public List<Map<String, Object>> getResvHistList(Reservation vo);
	public Map<String, Object> getUniqInfo(Reservation vo);
	public BodyVO getBodyList(BodyVO vo);
}
