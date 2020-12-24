package com.hokwang.dao;

import java.util.List;
import java.util.Map;

import com.hokwang.service.PatientService;
import com.hokwang.vo.BabyVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
public interface PatientMapper {
	
	public List<Map<String, Object>> AllpatientList(BabyVO vo);
		
	

}
