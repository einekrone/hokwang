
package com.hokwang.mobile.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hokwang.mobile.dao.MypageMapper;
import com.hokwang.mobile.service.MypageService;
import com.hokwang.vo.ParentVO;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageMapper dao;

	@Override
	public List<ParentVO> getParentInf(ParentVO vo) {
		return dao.getParentInf(vo);
	}

	@Override
	public int updateparentinfo(ParentVO vo) {
		return dao.updateparentinfo(vo);
	}

	@Override
	public int imgUpdate(ParentVO vo) {
		return dao.imgUpdate(vo);
	}
	
	

	
}
