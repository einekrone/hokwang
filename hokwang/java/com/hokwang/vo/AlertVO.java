package com.hokwang.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AlertVO { //알림
	String alert_no; //알림 번호
	String alert_cont;//내용
	String alert_title;//제목
	@JsonFormat(pattern="yyyy-MM-dd")
	Date alert_date;//일시
	String alert_send;//발신자
	String baby_no;
	

}
