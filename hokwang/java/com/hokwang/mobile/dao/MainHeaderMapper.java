package com.hokwang.mobile.dao;

import com.hokwang.vo.ParentVO;


public interface MainHeaderMapper {
	public ParentVO logInAction(ParentVO vo);
	public void registerAction(ParentVO vo);
	public int alertCntAction(ParentVO vo);
	
}