package com.hokwang.mobile.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;

public interface CheckHistService {
	public List<Map<String,Object>> checkHistlist(BabyVO vo);// 전체 접종 리스트
	public List<Map<String,Object>> checkHistlistIncomplete(BabyVO vo);
	public List<Map<String,Object>> checkHistlistComplete(BabyVO vo);
}
