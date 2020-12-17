package com.hokwang.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CheckHistVO {//검진 이력
	String hist_no;//검진이력 번호
	Date hist_date;//검진 일시
	String hist_count;//차수
	String stat_status;//검진 상태
	String hist_state;//검진 현황
}
