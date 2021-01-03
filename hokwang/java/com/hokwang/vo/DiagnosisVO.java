package com.hokwang.vo;


import org.springframework.stereotype.Component;

import lombok.Data;
@Data
@Component
public class DiagnosisVO {//진료기록
	String diag_no;//진료 번호
	String diag_time;//진료 시간
	String diaglist_memo;//의사소견
	String dis_code; //질병코드
	String diaglist_no; //진단서번호
	String resv_no;//예약번호
	String emp_no;//직원번호
	String PRES_NO; // 처방전 번호
}
