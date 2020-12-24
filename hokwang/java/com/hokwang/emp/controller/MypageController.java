package com.hokwang.emp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.dao.EmpMapper;
import com.hokwang.service.EmpService;
import com.hokwang.vo.EmployeeVO;

@Controller
public class MypageController {
	@Autowired
	EmpMapper empmapper;
	EmpService service;
	
	//페이지이동
	@RequestMapping("/mypage") //.do 같은거
	public ModelAndView MypageForm(EmployeeVO empvo, Model model){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage");
	  return mav;
	  }
	
	//등록페이지로 이동
	@GetMapping("/MypageInsert")
	public String MypageInsertForm() {
		return "user/insert";
	}
	
	/*
	 * //등록처리
	 * 
	 * @PostMapping("/MypageInsert") public String userInsert(HttpServletRequest
	 * request, EmployeeVO empvo) throws IllegalStateException, IOException {
	 * //모든파일을 empvo에 담아주어야함. //request miltipart로 캐스팅 MultipartHttpServletRequest
	 * multipartRequest = (MultipartHttpServletRequest) request; //이미지파일
	 * MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
	 * if(!multipartFile.isEmpty() && multipartFile.getSize()>0) { //이미지가 있다면 String
	 * path = request.getSession() .getServletContext() .getRealPath("/images");
	 * System.out.println("path="+path); multipartFile.transferTo( new File(path,
	 * multipartFile.getOriginalFilename()));//업로드할 위치
	 * empvo.setEmp_profile(multipartFile.getOriginalFilename()); //업로드한 파일이름만 DB에
	 * 저장. } service.insertUser(empvo); return"user/insert"; }
	 */
}
