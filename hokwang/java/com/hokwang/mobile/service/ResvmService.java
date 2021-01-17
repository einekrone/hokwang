package com.hokwang.mobile.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.AlertVO;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckupVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

public interface ResvmService {
	List<BabyVO> getChildList(BabyVO vo);
	List<CheckupVO> getVacList(BabyVO vo);
	void questInsert(QuestionVO quVO);
	int resvInsert(Reservation resvVO);
	int alertInsert(AlertVO vo);
	List<Map<String, Object>> getCntTimeList(Reservation vo);
	Map<String, Object> getResvInfo(Reservation vo);
	int resvDelete(Reservation vo);
	int resvUpdate(Reservation vo);
}
