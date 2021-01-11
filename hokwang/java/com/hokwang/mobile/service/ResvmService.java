package com.hokwang.mobile.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.ParentVO;

public interface ResvmService {

	List<Map<String, Object>> getChildList(ParentVO vo);
	
}
