package com.hokwang.mobile.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.Reservation;

public interface DocService {
	public List<Map<String,Object>> selectBaby(BabyVO vo);
	public List<BabyVO> babyLists(BabyVO vo);
	
	public int updateDocStatus(Reservation vo);
	
	public Map<String, Object> diagnosisDoc(Reservation vo);
	
}
