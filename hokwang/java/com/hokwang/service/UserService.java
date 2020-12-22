package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;

public interface UserService {
	public BabyVO getUser(BabyVO vo);
	public List<BabyVO> getBabyList(BabyVO vo);
	public List<Map> getUserListMap(BabyVO user);
	//등록
	public int insertBaby(BabyVO vo);

}
