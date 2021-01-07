package com.hokwang.vo;


import lombok.Data;

@Data
public class MedicineVO {//약
	String medi_no;//약 코드
	String medi_com;//회사명
	String medi_name;//약 이름
	String medi_composition;//약 구성요소
	String keyword;

}
