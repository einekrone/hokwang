package com.hokwang.mobile.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.ResvmMapper;
import com.hokwang.mobile.service.ResvmService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckupVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

@Service
public class ResvmServiceImpl implements ResvmService {
	@Autowired ResvmMapper resvmDao;

	@Override
	public List<BabyVO> getChildList(BabyVO vo) {
		return resvmDao.getChildList(vo);
	}

	@Override
	public List<CheckupVO> getVacList(BabyVO vo) {
		return resvmDao.getVacList(vo);
	}

	@Override
	public void questInsert(QuestionVO quVO) {
		resvmDao.questInsert(quVO);
	}

	@Override
	public int resvInsert(Reservation resvVO) {
		return resvmDao.resvInsert(resvVO);
	}

}
