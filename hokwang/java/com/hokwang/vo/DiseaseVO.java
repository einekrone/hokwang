package com.hokwang.vo;


import lombok.Data;

@Data
public class DiseaseVO {//질병
	String dis_code;//질병 코드
	String dis_name; //질병 이름
	String dis_price;//가격
	String dis_desc;//설명
	String keyword;
}
