package com.hokwang.mobile.service;


import com.hokwang.vo.ParentVO;

public interface MainHeaderService {
	public ParentVO logInAction(ParentVO vo);
	public void registerAction(ParentVO vo);
	public int alertCntAction(ParentVO vo);
}
