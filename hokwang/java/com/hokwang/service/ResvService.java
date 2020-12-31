package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.Images;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

public interface ResvService {

	public List<Map<String, Object>> getResvList(ResvSearch vo);
	public List<Map<String, Object>> getResvHistList(Reservation vo);
	public Map<String, Object> getPtInfo(Reservation vo);
	public Map<String, Object> getUniqInfo(Reservation vo);
	public List<Map<String, Object>> getNonPayList(ResvSearch vo);
	public int imgInsert(Images vo);
	public int imgDelete(Images vo);
	public List<Map<String, Object>> getImgList(Images vo);
	public List<Map<String, Object>> getRoomList();
}
