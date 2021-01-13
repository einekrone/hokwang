package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.ManagementVO;

public interface ScheMapper {
	
	public List<Map<String, Object>> getScheList(ManagementVO sche);
	public int insertSche(ManagementVO sche);
	public void deleteSche(ManagementVO sche);

}
