package com.hokwang.mobile.service;


import java.util.List;
import java.util.Map;

import com.hokwang.vo.AlertVO;
import com.hokwang.vo.ParentVO;

public interface MainHeaderService {
	public ParentVO logInAction(ParentVO vo);
	public void registerAction(ParentVO vo);
	public void kakaoRegisterAction(ParentVO vo);
	public int alertCntAction(ParentVO vo);
	public ParentVO checkId(ParentVO vo);
	public ParentVO checkEmail(ParentVO vo);
	public List<Map<String,Object>> alertInf(ParentVO vo);
	public void deleteAlert(AlertVO vo);
	public void changeTempPw(ParentVO vo);
	public ParentVO findIdInf(ParentVO vo);
	public ParentVO findPwInf(ParentVO vo);
}
