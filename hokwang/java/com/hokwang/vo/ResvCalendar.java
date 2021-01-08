package com.hokwang.vo;

import lombok.Data;

@Data
public class ResvCalendar {
	String year;
	String month;
	String day;
	int iDayOfWeek;
	int lastDate;
	String strDayOfWeek;
}
