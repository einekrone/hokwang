package com.hokwang.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class PrescriptionVO {//처방전
	String mdetail_no;//약 상세 번호
	String mdetail_count;//투여 횟수(하루 기준)
	String mdetail_account;//투여량(알약 수)
	String mdetail_total;//투여 일수(총 투약일수)
	Date pres_date;//처방 일시


}
