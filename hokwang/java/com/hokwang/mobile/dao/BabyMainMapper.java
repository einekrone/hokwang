package com.hokwang.mobile.dao;

import java.util.List;

import com.hokwang.vo.BabyVO;


public interface BabyMainMapper {
	
	public List<BabyVO> getBabyInf(BabyVO vo);
	public int insertbabyinfo(BabyVO vo);
	public int updatebabyinfo(BabyVO vo);
	public BabyVO getInfo(BabyVO vo);

}