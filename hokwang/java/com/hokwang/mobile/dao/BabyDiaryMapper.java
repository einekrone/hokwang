package com.hokwang.mobile.dao;

import java.util.List;

import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

public interface BabyDiaryMapper {
	public List<Reservation> reserlist(Reservation vo);// 예약 리스트
	public List<QuestionVO> question(QuestionVO vo); //문진표 리스트
}
