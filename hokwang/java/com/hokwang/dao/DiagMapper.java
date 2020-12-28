package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;


public interface DiagMapper {
	
	public List<Map<String,Object>> getInfoList();

	public List<BabyVO> getDiagList();
}
