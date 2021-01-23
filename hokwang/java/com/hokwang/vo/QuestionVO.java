package com.hokwang.vo;


import lombok.Data;

@Data
public class QuestionVO {//문진표
	String qust_no;//문진표 번호
	String a1;//질문1~32
	String a2;
	String a3;
	String a4;
	String nresv_no;	// 변경된 예약번호
}
