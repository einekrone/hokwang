package com.hokwang.mobile.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.ResvmMapper;
import com.hokwang.mobile.service.ResvmService;
import com.hokwang.vo.AlertVO;
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

	@Override
	public int alertInsert(AlertVO vo) {
		return resvmDao.alertInsert(vo);
	}

	@Override
	public List<Map<String, Object>> getCntTimeList(Reservation vo) {
		return resvmDao.getCntTimeList(vo);
	}

	@Override
	public Map<String, Object> getResvInfo(Reservation vo) {
		return resvmDao.getResvInfo(vo);
	}

	@Override
	public int resvDelete(Reservation vo) {
		return resvmDao.resvDelete(vo);
	}

	@Override
	public int resvUpdate(Reservation vo) {
		return resvmDao.resvUpdate(vo);
	}

	@Override
	public int questUpdate(QuestionVO vo) {
		return resvmDao.questUpdate(vo);
	}

	@Override
	public Object checkResvNo(Reservation vo) {
		return resvmDao.checkResvNo(vo);
	}

}
