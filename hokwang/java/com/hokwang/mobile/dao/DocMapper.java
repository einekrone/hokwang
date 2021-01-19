package com.hokwang.mobile.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;

public interface DocMapper {

public List<Map<String, Object>> selectBaby(BabyVO vo);
public List<BabyVO> babyLists(BabyVO vo);
}
