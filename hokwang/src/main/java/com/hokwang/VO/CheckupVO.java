package com.hokwang.VO;


import lombok.Data;

@Data
public class CheckupVO {//검진
	String chk_no;//검진 번호
	String chk_name;//접종명
	String chk_total;//총 차수
	String chk_desc;//설명
	String chk_code;//검진코드

}
