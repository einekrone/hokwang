package com.hokwang.emp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.dao.EmpMapper;
import com.hokwang.vo.EmployeeVO;

@Controller
public class LoginController {
	@Autowired
	EmpMapper empmapper;
	
	//페이지이동
	@RequestMapping("/login") //.do 같은거
	public ModelAndView loginForm(EmployeeVO empvo, Model model){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
	  return mav;
	  }
	
	@GetMapping("/login") //로그인 페이지로이동  url이 같지만 get/post로 구분
	public String loginForm() {
		return "tiles/login";
	}
	
	@PostMapping("/login") //로그인처리
	public String login(HttpSession session) {
		//로그인처리
		session.setAttribute("loginId", "user");
		return "redirect:/empSelect";
	}
	
	@GetMapping("/logout") //로그아웃
	public String logout(HttpSession session) {
		session.invalidate(); //세션무효화
		return "tiles/login";
	}
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/ajax/loginList")
	 */
}
