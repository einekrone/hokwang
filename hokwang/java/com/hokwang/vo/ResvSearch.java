package com.hokwang.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ResvSearch {
	String searchType;
	String keyword;
	String resv_date;//예약 날짜
}
