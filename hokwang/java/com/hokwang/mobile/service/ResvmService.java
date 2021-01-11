package com.hokwang.mobile.service;

import java.util.List;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckupVO;

public interface ResvmService {

	List<BabyVO> getChildList(BabyVO vo);
	List<CheckupVO> getVacList();
	
}
