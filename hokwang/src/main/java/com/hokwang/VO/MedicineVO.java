package com.hokwang.VO;


import lombok.Data;

@Data
public class MedicineVO {//약
	String medi_no;//약 번호
	String medi_route;//투여 경로
	String medi_formul;//제형 구분
	String medi_ingre;//일반명(성분)

}
