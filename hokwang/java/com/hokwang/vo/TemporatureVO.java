package com.hokwang.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class TemporatureVO {//체온
	String temp_no;//체온 번호
	String temp_temp;//체온
	@JsonFormat(pattern = "yy/MM/dd")
	Date temp_date;//작성 일자
	String baby_no;//아기번호
}
