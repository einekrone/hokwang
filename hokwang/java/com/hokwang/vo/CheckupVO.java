package com.hokwang.vo;


import lombok.Data;

@Data
public class CheckupVO {//접종
	String chk_no;//예방접종 번호 시퀀스
	String chk_name;//백신명
	String chk_first;//최초 접종일
	String chk_dis;//질병명

}
