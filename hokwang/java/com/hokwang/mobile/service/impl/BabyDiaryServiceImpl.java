package com.hokwang.mobile.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.BabyDiaryMapper;
import com.hokwang.mobile.service.BabyDiaryService;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

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
	
	
}
