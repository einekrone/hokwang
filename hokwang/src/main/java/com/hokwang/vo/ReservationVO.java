package com.hokwang.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationVO {//예약

	String resv_no;//예약 번호
	Date resv_date;//예약 날짜
	String resv_time;//예약 시간
	String resv_status;//진료 상태
	String resv_detail;//상세 증상
	String resv_memo;//특이사항
	String resv_payyn;//결제 여부
	String resv_room;//예약된 진료실
	

}
