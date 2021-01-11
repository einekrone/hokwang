package com.hokwang.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PrescriptionVO {//처방전
	String pres_no;//약 상세 번호
	String pres_count;//투여 횟수(하루 기준)
	String pres_account;//투여량(알약 수)
	String pres_total;//투여 일수(총 투약일수)
	Date pres_date;//처방 일시
	String resv_no;//예약 번호
	String medi_no; //약번호


}
