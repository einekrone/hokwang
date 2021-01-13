package com.hokwang.mobile.service;

import java.util.List;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckupVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

public interface ResvmService {

	List<BabyVO> getChildList(BabyVO vo);
	List<CheckupVO> getVacList();
	void questInsert(QuestionVO quVO);
	int resvInsert(Reservation resvVO);
}
