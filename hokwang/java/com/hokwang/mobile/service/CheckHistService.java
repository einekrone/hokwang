package com.hokwang.mobile.service;

import java.util.List;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckHistVO;

public interface CheckHistService {
	public List<CheckHistVO> checkHistlist(BabyVO vo);// 전체 접종 리스트

}
