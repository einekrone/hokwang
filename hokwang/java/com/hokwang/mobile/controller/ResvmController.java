package com.hokwang.mobile.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.ResvmService;
import com.hokwang.vo.AlertVO;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.CheckupVO;
import com.hokwang.vo.Images;
import com.hokwang.vo.ParentVO;
import com.hokwang.vo.QuestionVO;
import com.hokwang.vo.Reservation;

@Controller
public class ResvmController {
	@Autowired
	ResvmService resvmSvc;

	// 예약 자녀 리스트
	@ResponseBody @RequestMapping(value="/ajax/childList")

	public List<BabyVO> getChildList(BabyVO vo, Model model) {
		List<BabyVO> list = resvmSvc.getChildList(vo);
		model.addAttribute("childList", list);
		return list;
	}

	// 예약 자녀 리스트
	@ResponseBody
	@RequestMapping(value = "/ajax/vacList")
	public List<CheckupVO> getVacList(BabyVO vo, Model model) {
		List<CheckupVO> list = resvmSvc.getVacList(vo);
		model.addAttribute("vacList", list);
		return list;
	}
	
	// 예약 중복 체크
	@ResponseBody
	@RequestMapping("/ajax/checkResvNo")
	public boolean checkResvNo(Reservation vo) {
		if(resvmSvc.checkResvNo(vo) == null) {
			return true;
		}
		return false;
	}

	// 예약 등록(+문진표, 알림)
	@ResponseBody
	@RequestMapping("/ajax/insertReservation")
	public String questInsert(QuestionVO quVO, Reservation resvVO, AlertVO altVO) {
		resvmSvc.resvInsert(resvVO);
		quVO.setQust_no(resvVO.getResv_no());
		resvmSvc.questInsert(quVO);
		
		// 예약한 아기 번호를 외래키로 받아서 alert에 insert
		altVO.setBaby_no(resvVO.getBaby_no());
		altVO.setAlert_title(resvVO.getResv_no()+" 예약 완료");
		String alertCont = resvVO.getResv_date() + " " + resvVO.getResv_time() +" 예약되었습니다.";
		altVO.setAlert_cont(alertCont);
		altVO.setAlert_send("호광병원");
		resvmSvc.alertInsert(altVO);
		return "redirect:/mobile";
	}

	// 예약된 시간 리스트
	@ResponseBody
	@RequestMapping(value = "/ajax/getCntTimeList")
	public List<Map<String, Object>> getCntTimeList(Reservation vo) {
		List<Map<String, Object>> list = resvmSvc.getCntTimeList(vo);
		return list;
	}
	
	// 예약 정보(+문진표)
	@ResponseBody
	@RequestMapping("/ajax/resvInfo")
	public Map<String, Object> getResvInfo(Reservation vo) {
		System.out.println("조회할 예약 : "+vo.getResv_no());
		return resvmSvc.getResvInfo(vo);
	}
	
	// 예약 삭제
	@ResponseBody
	@RequestMapping("/ajax/resvDelete")
	public int resvDelete(Reservation vo) {
		System.out.println("삭제할 예약 : "+vo.getResv_no());
		return resvmSvc.resvDelete(vo);
	}
	
	// 예약 수정
	@ResponseBody
	@RequestMapping("/ajax/resvUpdate")
	public int resvUpdate(Reservation resvVO, AlertVO altVO, QuestionVO quVO) {
		System.out.println("수정할 예약 : "+resvVO.getResv_no());
		System.out.println("예약 시간 : "+resvVO.getResv_time());
		System.out.println("예약 아기 : "+resvVO.getBaby_no());
		quVO.setNresv_no(resvVO.getNresv_no());
		quVO.setQust_no(resvVO.getResv_no());
		resvmSvc.resvUpdate(resvVO);
		
		System.out.println("문진표 번호 : "+quVO.getQust_no());
		System.out.println("문진표 새번호 : "+quVO.getNresv_no());
		
		resvmSvc.questUpdate(quVO);
		
		altVO.setBaby_no(resvVO.getBaby_no());
		altVO.setAlert_title(resvVO.getResv_no()+" 예약 수정 완료");
		String alertCont = resvVO.getResv_date() + " " + resvVO.getResv_time() +"로 수정되었습니다.";
		altVO.setAlert_cont(alertCont);
		altVO.setAlert_send("호광병원");
		
		return resvmSvc.alertInsert(altVO);
	}
}
