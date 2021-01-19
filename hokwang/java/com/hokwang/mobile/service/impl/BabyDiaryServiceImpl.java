package com.hokwang.mobile.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.BabyDiaryMapper;
import com.hokwang.mobile.service.BabyDiaryService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.BodyVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.TemporatureVO;

@Service
public class BabyDiaryServiceImpl implements BabyDiaryService {
	@Autowired BabyDiaryMapper dao;

	@Override
	public List<Reservation> reserlist(Reservation vo) {
		// TODO Auto-generated method stub
		return dao.reserlist(vo);
	}

	@Override
	public List<QuestionVO> question(QuestionVO vo) {
		// TODO Auto-generated method stub
		return dao.question(vo);
	}

	@Override
	public List<BabyVO> getBabyList(BabyVO vo) {
		// TODO Auto-generated method stub
		return dao.getBabyList(vo);
	}

	@Override
	public List<BabyVO> getBabyinfo(BabyVO vo) {
		// TODO Auto-generated method stub
		return dao.getBabyinfo(vo);
	}

	@Override
	public List<Map<String, Object>> allreser(Reservation vo) {
		// TODO Auto-generated method stub
		return dao.allreser(vo);
	}

	@Override
	public int insertbodyinfo(BodyVO vo) {
		// TODO Auto-generated method stub
		return dao.insertbodyinfo(vo);
				
	}

	@Override
	public List<BodyVO> checkBody(BodyVO vo) {
		// TODO Auto-generated method stub
		return dao.checkBody(vo);
	}

	@Override
	public List<TemporatureVO> checkTemporature(TemporatureVO vo) {
		// TODO Auto-generated method stub
		return dao.checkTemporature(vo);
	}

	@Override
	public int bodyDel(BodyVO vo) {
		// TODO Auto-generated method stub
		return dao.bodyDel(vo);
	}
	
	
}
