package com.hokwang.dao;

import java.util.List;

import com.hokwang.vo.BabyVO;

public interface DiagMapper {

	public List<BabyVO> getDiagList(BabyVO baby);
}
