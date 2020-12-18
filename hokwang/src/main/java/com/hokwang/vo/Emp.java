package com.hokwang.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Emp {
    String employeeId;   
	String firstName;
	String lastName;
	String email;	
	Date hireDate;	
	String jobId;	
	String departmentId;
	Integer salary;
	
	
}
