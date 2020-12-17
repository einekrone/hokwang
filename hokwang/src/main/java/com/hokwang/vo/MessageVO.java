package com.hokwang.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MessageVO {//쪽지
	String msg_no;//쪽지 번호
	String msg_cont;//내용
	Date msg_date;//일시
	String msg_yn;//수신여부

}
