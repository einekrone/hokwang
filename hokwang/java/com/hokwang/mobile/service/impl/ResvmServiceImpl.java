package com.hokwang.mobile.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.ResvMapper2;
import com.hokwang.mobile.service.ResvmService;
import com.hokwang.vo.ParentVO;

@Service
public class ResvmServiceImpl implements ResvmService {
	@Autowired ResvMapper2 resvmDao;

	@Override
	public List<Map<String, Object>> getChildList(ParentVO vo) {
		return resvmDao.getChildList(vo);
	}

}
