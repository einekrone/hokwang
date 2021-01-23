package com.hokwang.mobile.service;

import java.util.List;

import com.hokwang.vo.ParentVO;

public interface MypageService {
	public List<ParentVO> getParentInf(ParentVO vo);
	public int updateparentinfo(ParentVO vo);
	public int imgUpdate(ParentVO vo);
	public int updatePw(ParentVO vo);
	public ParentVO chkEmail(ParentVO vo);
	public void deleteTempPw(ParentVO vo);
}
