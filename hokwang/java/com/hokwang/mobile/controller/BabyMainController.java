
package com.hokwang.mobile.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.mobile.service.BabyMainService;
import com.hokwang.vo.BabyVO;

@Controller
public class BabyMainController {
	@Autowired
	BabyMainService dao;

	@ResponseBody
	@RequestMapping("/ajax/getBabyInf")
	public List<BabyVO> getBabyInf() {
		return dao.getBabyInf();
	}

//	@ResponseBody
//	@RequestMapping("/ajax/insertbabyinfo")
//	public int insertbabyinfo(BabyVO vo) {
//	return dao.insertbabyinfo(vo);
//	}

	@ResponseBody
	@RequestMapping("/insertbabyinfo")
	public ModelAndView insertbabyinfo(HttpServletRequest request, BabyVO vo) throws IllegalStateException, IOException {
		System.out.println("insertbabyinfo");
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

}
