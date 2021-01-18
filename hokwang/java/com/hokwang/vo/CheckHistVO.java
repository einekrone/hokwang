package com.hokwang.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CheckHistVO {//접종 이력
	String hist_no;//접종이력 번호 시퀀스
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern = "YYYY-MM-DD", timezone = "Asia/Seoul")
	Date hist_date; // 검진일시
	String hist_state;// 검진현황
	String chk_no; //예방접종 번호
	String resv_no; //예약번호
}
