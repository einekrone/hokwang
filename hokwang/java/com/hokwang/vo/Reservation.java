package com.hokwang.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Reservation {//예약

	String resv_no;//예약 번호
//	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	Date resv_date;//예약 날짜
	String resv_time;//예약 시간
	String resv_status;//진료 상태
	String resv_detail;//상세 증상
	String resv_memo;//특이사항
	String resv_payyn;//결제 여부
	String resv_room;//예약된 진료실
	String chk_type;	// 검진 타입
	String resv_type;	// 예약 종류

	String qust_no;//문진표 번호
	
	String resv_datetime;	// 예약 일시
	String baby_no;		// 아기번호
	String chk_no;//검진 번호
	String emp_no;
}
