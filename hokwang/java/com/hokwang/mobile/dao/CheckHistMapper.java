package com.hokwang.mobile.dao;

import java.util.List;

import com.hokwang.vo.CheckHistVO;

public interface CheckHistMapper {
	public List<CheckHistVO> checkHistlist(CheckHistVO vo);// 전체 접종 리스트
}
