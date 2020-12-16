package com.hokwang.VO;


import lombok.Data;

@Data
public class EmployeeVO {//관리자
	String emp_no;//사원 번호
	String emp_name;//이름
	String emp_regno;//주민번호
	String emp_tel;//전화번호
	String emp_pwd;//비밀번호
	String emp_addr;//주소
	String emp_post;//우편번호
	String emp_author;//권한
	String emp_lic;//면허번호
	String emp_room;//진료실

}
