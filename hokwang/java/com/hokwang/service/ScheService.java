package com.hokwang.service;

import java.util.List;

import com.hokwang.vo.ManagementVO;

public interface ScheService {
	public List<ManagementVO> getScheList(ManagementVO sche);
	public int insertSche(ManagementVO sche);
	public int deleteSche(ManagementVO sche);
}
