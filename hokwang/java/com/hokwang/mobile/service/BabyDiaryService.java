package com.hokwang.mobile.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

public interface BabyDiaryService {
	public List<Reservation> reserlist(Reservation vo);//예약 리스트
	public List<QuestionVO> question(QuestionVO vo); //문진표 리스트
	public List<BabyVO> getBabyList(BabyVO vo);
	public List<BabyVO> getBabyinfo(BabyVO vo);//아기 정보
	
	public List<Map<String,Object>> allreser(Reservation vo);
}
