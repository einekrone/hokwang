package com.hokwang.vo;


import org.springframework.stereotype.Component;

import lombok.Data;
@Data
@Component
public class DiagnosisVO {//진료기록
	String diag_no;//진료 번호
	String diag_time;//진료 시간
	String diag_photo;//사진
	String resv_no;//예약번호
	String emp_no;//직원번호
	int diaglist_no;//질병 코드
}
