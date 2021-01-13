package com.hokwang.mobile.service;

import java.util.List;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.ParentVO;

public interface BabyMainService {
	public List<BabyVO> getBabyInf(BabyVO vo);
	public int insertbabyinfo(BabyVO vo);
	public int updatebabyinfo(BabyVO vo);
	public BabyVO getInfo(BabyVO vo);
}
