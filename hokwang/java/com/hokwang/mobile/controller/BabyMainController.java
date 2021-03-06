
package com.hokwang.mobile.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.mobile.service.BabyMainService;
import com.hokwang.vo.BabyVO;
import com.hokwang.vo.ParentVO;

@Controller
public class BabyMainController {
	@Autowired
	BabyMainService dao;

	@ResponseBody
	@RequestMapping("/ajax/getBabyInf")
	public List<BabyVO> getBabyInf(HttpSession session,BabyVO vo) {
		
		vo.setParent_no(((ParentVO)session.getAttribute("parent_vo")).getParent_no());
		//System.out.println(vo);
		return dao.getBabyInf(vo);
	}


	@ResponseBody
	@RequestMapping("/insertbabyinfo")
	public ModelAndView insertbabyinfo(HttpSession session,HttpServletRequest request, BabyVO vo) throws IllegalStateException, IOException {
		vo.setParent_no(((ParentVO)session.getAttribute("parent_vo")).getParent_no());
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/resources/img");
			//System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			vo.setBaby_pic(multipartFile.getOriginalFilename());
			
		}
		dao.insertbabyinfo(vo);
		return new ModelAndView("redirect:/child");
	}
	
	@ResponseBody
	@RequestMapping("/getInfo")
	public BabyVO getInfo(BabyVO vo) {		
		return dao.getInfo(vo);
	}
	
	@ResponseBody
	@RequestMapping("/updatebabyinfo")
	public ModelAndView updatebabyinfo(HttpSession session, HttpServletRequest request, BabyVO vo) throws IllegalStateException, IOException {
		vo.setParent_no(((ParentVO)session.getAttribute("parent_vo")).getParent_no());
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("uploadFile1");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/resources/img");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			vo.setBaby_pic(multipartFile.getOriginalFilename());
			
		}
		System.out.println("pic : "+vo.getBaby_pic());
		System.out.println(vo);
		dao.updatebabyinfo(vo);
		return new ModelAndView("redirect:/child");
	}
	
	
	
	

}
