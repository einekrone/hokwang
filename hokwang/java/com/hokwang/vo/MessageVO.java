package com.hokwang.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MessageVO {//쪽지
	String msg_no;//쪽지 번호
	String msg_cont;//내용
	@JsonFormat(pattern="yyyyMMdd")
	Date msg_date;//일시
	String msg_yn;//수신여부
	String emp_sendno;
	String emp_resvno;
	//message를 위해 추가
	String emp_name;
	String emp_profile;
	
}
