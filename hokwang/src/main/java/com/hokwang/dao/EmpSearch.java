package com.hokwang.dao;

import com.hokwang.vo.Emp;

import lombok.Data;

public class EmpSearch extends Emp {
	Integer minSalary;
	Integer maxSalary;
	Integer first;
	Integer last;
	String[] list;

}
