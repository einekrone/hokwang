package com.hokwang.vo;


import lombok.Data;

@Data
public class HospitalVO {//병원
	String hosp_no;//병원 번호
	String hosp_name;//병원 명
	String hosp_addr;//병원 주소
	String hosp_hours;//영업 시간
	String hosp_tel;//전화 번호
	String hosp_fax;//팩스 번호

}
