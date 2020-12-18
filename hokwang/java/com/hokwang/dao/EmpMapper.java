package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.Emp;

public interface EmpMapper {

	public Emp getEmp(Emp empVO);
	public List<Emp> getEmpList(Emp emp);
	public void empInsert(Emp empVO);
	public String getName(Integer id);
	public List<Map<String, Object>> getEmpMap();
	public List<Map<String, Object>> getDeptEmpCnt();
}

