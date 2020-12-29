package com.hokwang.resv.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.service.ResvService;
import com.hokwang.vo.Reservation;
import com.hokwang.vo.ResvSearch;

@Controller
public class ResvController {
	@Autowired
	ResvService resvSvc;

	// 페이지 이동
	@RequestMapping("/resve")
	public ModelAndView resvForm(Reservation resv) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reserve");
		return mav;
	}

	// 전체 예약 리스트 조회
	@ResponseBody
	@RequestMapping("/ajax/resvList")
	public List<Map<String, Object>> getResvList(ResvSearch vo) {
		return resvSvc.getResvList(vo);
	}

	// 선택된 환자 예약/진료 이력 리스트 조회
	@ResponseBody
	@RequestMapping("/ajax/resvHstList")
	public List<Map<String, Object>> getResvHistList(Reservation vo) {
		return resvSvc.getResvHistList(vo);
	}

	// 선택된 환자 상세 정보
	@ResponseBody
	@RequestMapping("/ajax/ptInfo")
	public Map<String, Object> getPtInfo(Reservation vo) {
		return resvSvc.getPtInfo(vo);
	}

	// 선택된 환자 특이사항 정보
	@ResponseBody
	@RequestMapping("/ajax/uniqInfo")
	public Map<String, Object> getUniqInfo(Reservation vo) {
		return resvSvc.getUniqInfo(vo);
	}

	// 미수납/수납대기 리스트 조회
	@ResponseBody
	@RequestMapping("/ajax/nonPayList")
	public List<Map<String, Object>> getNonPayList(ResvSearch vo) {
		return resvSvc.getNonPayList(vo);
	}

	// 진료 사진 관리(등록,삭제,조회)
	@ResponseBody
	@RequestMapping("/ajax/imgManage")
	public String imgManage(HttpServletRequest request, Reservation vo) throws IllegalStateException, IOException {
		System.out.println("imgManage>>");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("imgInput");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/resources/img"); // 업로드할 경로
			// getOriginalFilename : 업로드 후 파일명
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			vo.setDiag_photo(multipartFile.getOriginalFilename());
		}
		return resvSvc.imgManage(vo);
	}
}
