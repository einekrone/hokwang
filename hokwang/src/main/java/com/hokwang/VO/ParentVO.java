package com.hokwang.VO;


import lombok.Data;

@Data
public class ParentVO {//보호자
	String parent_no;//보호자 번호
	String parent_name;//이름
	String parent_tel;//전화번호
	String parent_addr;//주소
	String parent_addrDetail;//상세주소
	String parent_post;//우편번호
	String parent_email;//이메일
	String parent_regno1;//주민번호1
	String parent_regno2;//주민번호2
	String parent_token;//토큰
	String parent_sns;//소셜타입

}
