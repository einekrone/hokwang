package com.hokwang.vo;

import lombok.Data;

@Data
public class BabyJoinToDiagnosisVO {
	String baby_no;//아기번호
	String baby_name;//이름
	String baby_regno1;//주민번호1
	String baby_regno2;//주민번호2
	String baby_blood;//혈액형
	String baby_gender;//성별
	String baby_visit;//방문여부
	String baby_pic;//사진
	
	//진료 vo 인데 합쳐야함
	String diag_no;//진료 번호
	String diag_time;//진료 시간
	String diag_photo;//사진
	String resv_no;//예약번호
	String emp_no;//직원번호
	int diaglist_no;//질병 코드
}
