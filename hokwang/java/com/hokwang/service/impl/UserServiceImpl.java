package com.hokwang.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hokwang.dao.DiagMapper;
import com.hokwang.service.UserService;
import com.hokwang.vo.BabyVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	DiagMapper userDAO;
	@Override
	public int insertBaby(BabyVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public BabyVO getUser(BabyVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<BabyVO> getBabyList(BabyVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getDiagList();
	}
	@Override
	public List<Map> getUserListMap(BabyVO user) {
		// TODO Auto-generated method stub
		return null;
	}
}
