package com.hokwang.mobile.dao;

import java.util.List;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckupVO;

public interface ResvmMapper {
	public List<BabyVO> getChildList(BabyVO vo);
	public List<CheckupVO> getVacList();
}
