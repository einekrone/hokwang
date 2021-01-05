package com.hokwang.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BodyVO {//키,몸무게
	String body_no;//키,몸무게 번호
	String body_height;//키
	String body_weight;//몸무게
	Date body_date;//작성 일자
	String baby_no;

}
