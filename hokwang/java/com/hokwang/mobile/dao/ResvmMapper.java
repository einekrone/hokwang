package com.hokwang.mobile.dao;

import java.util.List;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckupVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

public interface ResvmMapper {
	public List<BabyVO> getChildList(BabyVO vo);
	public List<CheckupVO> getVacList(BabyVO vo);
	public int questInsert(QuestionVO vo);
	public int resvInsert(Reservation vo);
	public int alertInsert(BabyVO vo);
}
