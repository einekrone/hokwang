package com.hokwang.service;

import java.util.List;
import java.util.Map;

import com.hokwang.vo.BabyVO;
import com.hokwang.vo.BodyVO;
import com.hokwang.vo.DiagnosisVO;
import com.hokwang.vo.DiseaseVO;
import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MedicineVO;
import com.hokwang.vo.PrescriptionVO;
import com.hokwang.vo.Reservation;

public interface DiagService {

	public Map<String,Object> getInfoList(Reservation vo);
	public List<Map<String, Object>> getResvList(EmployeeVO vo);
	public List<Map<String, Object>> getResvHistList(BabyVO vo);
	public Map<String, Object> getUniqInfo(Reservation vo);
	public BodyVO getBodyList(BodyVO vo);
	public DiagnosisVO getDiagDetail(DiagnosisVO vo);
	public List<Map<String,Object>> getDiagDetail2(DiagnosisVO vo);
	public List<Map<String, Object>> getMedicine(PrescriptionVO vo);
	public List<DiseaseVO> getDisease(DiseaseVO vo);
	public List<MedicineVO> getMedineList(MedicineVO vo);
	public int insertDiagList(DiagnosisVO vo);
	
	public int insertPres(PrescriptionVO vo);
	public List<PrescriptionVO> getPrescription(PrescriptionVO vo);
	public int updatePrescription(PrescriptionVO vo);
	public int deletePrescription(PrescriptionVO vo);
	
	public int UpdateDiagStatus(Reservation vo);
}
