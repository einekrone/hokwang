package com.hokwang.mobile.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.AlertVO;
import com.hokwang.vo.ParentVO;


public interface MainHeaderMapper {
	public ParentVO logInAction(ParentVO vo);
	public void registerAction(ParentVO vo);
	public void kakaoRegisterAction(ParentVO vo);
	public int alertCntAction(ParentVO vo);
	public ParentVO checkId(ParentVO vo);
	public ParentVO checkEmail(ParentVO vo);
	public List<Map<String,Object>> alertInf(ParentVO vo); 
	public boolean deleteAlert(AlertVO vo);
	public ParentVO findIdInf(ParentVO vo);
	public ParentVO findPwInf(ParentVO vo);
	public void changeTempPw(ParentVO vo);
}