package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.Emp;
import com.hokwang.vo.EmployeeVO;

public interface EmpMapper {

	public Emp getEmp(Emp empVO);
	public List<Emp> getEmpList();
	public void empInsert(Emp empVO);
	public String getName(Integer id);
	public List<Map<String, Object>> getEmpMap();
	public List<Map<String, Object>> getDeptEmpCnt();
	public int updateUser(EmployeeVO vo); //이미지
}

