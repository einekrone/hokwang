package com.hokwang.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class TemporatureVO {//체온
	String temp_no;//체온 번호
	String temp_temp;//체온
	Date temp_date;//작성 일자

}
