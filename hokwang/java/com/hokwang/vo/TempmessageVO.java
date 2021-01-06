package com.hokwang.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TempmessageVO {//쪽지
	String temp_no;//쪽지 번호
	String temp_cont;//내용
	@JsonFormat(pattern="yyyyMMdd")
	Date temp_date;//일시
	String temp_sendno;
	String temp_resvno;
	
}
