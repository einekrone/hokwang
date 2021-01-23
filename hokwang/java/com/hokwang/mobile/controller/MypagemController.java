
package com.hokwang.mobile.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.mobile.service.MypageService;
import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.ParentVO;

@Controller
public class MypagemController {
	@Autowired
	MypageService dao;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@ResponseBody
	@RequestMapping("/ajax/getParentInf")
	public List<ParentVO> getParentInf(ParentVO vo) {
		return dao.getParentInf(vo);
	}
	
	@ResponseBody
	@RequestMapping("/updateparentinfo")
	public ModelAndView updateparentinfo(HttpSession session,HttpServletRequest request, ParentVO vo) throws IllegalStateException, IOException {
		System.out.println(session.getAttribute("parent_vo"));
		vo.setParent_no(((ParentVO)session.getAttribute("parent_vo")).getParent_no());
		
			
		System.out.println("부모수정"+vo);
		dao.updateparentinfo(vo);
		return new ModelAndView("redirect:/mmypage");
	}
	
	@ResponseBody
	@RequestMapping("/ajax/imgUpdate")
	public int imgUpdate(HttpSession session,HttpServletRequest request, ParentVO vo) throws IllegalStateException, IOException {
		System.out.println("맛잇나광호야"+session.getAttribute("parent_vo"));
		System.out.println("vo값이 넘어오나?"+vo);
		vo.setParent_no(((ParentVO)session.getAttribute("parent_vo")).getParent_no());
		// request multipart로 캐스팅
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("file");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/resources/img");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			vo.setParent_img(multipartFile.getOriginalFilename());
			
		}
		System.out.println(vo);
		
		return dao.imgUpdate(vo);
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/ajax/updatePw")
	public boolean updatePw(ParentVO vo, HttpSession session) {
		vo.setParent_no(((ParentVO) session.getAttribute("parent_vo")).getParent_no());
		System.out.println(vo);
		
		ParentVO sessionVO = new ParentVO();
		sessionVO = (ParentVO)session.getAttribute("parent_vo");
		if(sessionVO.getParent_temppw() != null) { //세션값있는경우
			System.out.println("임시비밀번호가 있는 경우");
			if (sessionVO.getParent_temppw().equals(vo.getParent_pw1())) {
				String inputpass = vo.getParent_pw();
				vo.setParent_pw(pwdEncoder.encode(inputpass));
				if (dao.updatePw(vo) == 1) {
					//임시비밀번호 삭제
					dao.deleteTempPw(vo);
					return true;
				}
			}
		}
		else {//임시비밀번호가 없는경우
			System.out.println("기존의 임시비밀번호가 없는경우"); //match
			if (pwdEncoder.matches(vo.getParent_pw1(),sessionVO.getParent_pw())) {
				System.out.println("일단 일치는 함");
				String inputpass2 = vo.getParent_pw();
				vo.setParent_pw(pwdEncoder.encode(inputpass2));
				if (dao.updatePw(vo) == 1) {
					return true;
				}
			} 
		}
		
		return false;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/ajax/chkEmail")
	public boolean chkEmail(ParentVO vo) {
		if(dao.chkEmail(vo) == null) {
			return true;
		}
		return false;
	}
	

	
	
	
	
	

}
