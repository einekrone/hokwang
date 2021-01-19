package com.hokwang.mobile.dao;

import java.util.List;

import com.hokwang.vo.ParentVO;


public interface MypageMapper {
	
	public List<ParentVO> getParentInf(ParentVO vo);
	public int updateparentinfo(ParentVO vo);
	public int imgUpdate(ParentVO vo);
	public int updatePw(ParentVO vo);

}