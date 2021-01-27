package com.hokwang.mobile.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.BodyVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.TemporatureVO;

public interface BabyDiaryMapper {
	public List<Map<String,Object>> reserlist(Reservation vo);// 예약 리스트
	public List<QuestionVO> question(QuestionVO vo); //문진표 리스트
	public List<BabyVO> getBabyList(BabyVO vo);//아기 셀렉트
	public List<BabyVO> getBabyinfo(BabyVO vo);//아기 정보
	public List<BodyVO> checkBody(BodyVO vo);//아기 키,몸무게 정보
	public List<TemporatureVO> checkTemporature(TemporatureVO vo); //아기 체온 정보 
	public List<Map<String,Object>> allreser(Reservation vo);
	public int insertbodyinfo(BodyVO vo); // 키/체중등록
	public int bodyDel(BodyVO vo); // 아기 키,몸무게 삭제
	public int deleteTemp(TemporatureVO vo); // 체온 삭제
	public void insertBodyInf(BodyVO vo);
	public void insertTempInf(TemporatureVO vo);
	
}
