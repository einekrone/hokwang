
package com.hokwang.mobile.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.mobile.service.MainHeaderService;
import com.hokwang.vo.ParentVO;

@Controller
public class MainHeaderController {
	@Autowired
	MainHeaderService dao;

	@ResponseBody
	@RequestMapping("/ajax/logInAction")
	public boolean logInAction(ParentVO vo,HttpSession session) {
		vo = dao.logInAction(vo);
		if (vo != null) {
			session.setAttribute("parent_vo", vo);
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/registerAction")
	public boolean registerAction(ParentVO vo) {
		dao.registerAction(vo);
		return true;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/alertCntAction")
	public int alertCntAction(ParentVO vo) {
		return dao.alertCntAction(vo);
	}

	@GetMapping("/logoutM") //로그아웃
	public String logoutM(HttpSession session) {
		session.invalidate(); //세션무효화
		return "redirect:/mobile";
	}
	
	
	
	
}
