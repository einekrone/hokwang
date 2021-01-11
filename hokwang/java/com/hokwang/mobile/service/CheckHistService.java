package com.hokwang.mobile.service;

import java.util.List;

import com.hokwang.vo.CheckHistVO;

public interface CheckHistService {
	public List<CheckHistVO> checkHistlist(CheckHistVO vo);// 전체 접종 리스트
}
