package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.BodyVO;
import com.hokwang.vo.DiagnosisVO;
import com.hokwang.vo.DiesSearch;
import com.hokwang.vo.DiseaseVO;
import com.hokwang.vo.MedicineVO;
import com.hokwang.vo.PrescriptionVO;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

public interface DiagService {

	public Map<String,Object> getInfoList(Reservation vo);
	public List<Map<String, Object>> getResvList(ResvSearch vo);
	public List<DiagnosisVO> getResvHistList(BabyVO vo);
	public Map<String, Object> getUniqInfo(Reservation vo);
	public BodyVO getBodyList(BodyVO vo);
	public DiagnosisVO getDiagDetail(DiagnosisVO vo);
	public List<Map<String,Object>> getDiagDetail2(DiagnosisVO vo);
	public List<Map<String, Object>> getMedicine(PrescriptionVO vo);
	public Map<String, Object> getDisease(DiesSearch vo);
	public Map<String, Object> schMedicine(DiesSearch vo);
	public List<Map<String, Object>> getMedineList(MedicineVO vo);
}
