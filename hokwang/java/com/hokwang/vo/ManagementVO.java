package com.hokwang.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ManagementVO {//근태관리
	String work_no;//근태 번호
	Date work_date;//근무 일정
	Date work_stdate;//휴가 시작
	Date work_endate;//휴가 종료
	String work_ctg;//카테고리
	String work_cause;//사유
	String emp_no;

}
