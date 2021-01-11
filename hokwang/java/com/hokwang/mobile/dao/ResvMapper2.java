package com.hokwang.mobile.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.ParentVO;

public interface ResvMapper2 {
	public List<Map<String, Object>> getChildList(ParentVO vo);
}
