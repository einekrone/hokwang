package com.hokwang.vo;



import lombok.Data;

@Data
public class DiagnosisListVO {//진단서
	String diaglist_no;//진단서 번호
	String diaglist_name;//질병명
	String diaglist_detail;//질병상세
	String diaglist_memo;//의사소견
	String diaglist_usage;//용도

}
