package com.hokwang.emp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hokwang.service.EmployeeService;
import com.hokwang.vo.EmployeeVO;

@Controller
public class LoginController {
	@Autowired
	EmployeeService service;
	
	/*
	 * //페이지이동
	 * 
	 * @RequestMapping("/login") //.do 같은거 public ModelAndView loginForm(EmployeeVO
	 * empvo, Model model){ ModelAndView mav = new ModelAndView();
	 * mav.setViewName("login"); return mav; }
	 */
	
	/*
	 * @GetMapping("/login") //로그인 페이지로이동 url이 같지만 get/post로 구분 public String
	 * loginForm() { return "login"; }
	 */
	//로그인처리부분
	@RequestMapping(value="/login", method= {RequestMethod.GET, RequestMethod.POST})
	public String employeeLogin(EmployeeVO emp_vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		
		HttpSession session = req.getSession();
		EmployeeVO vo = service.getEmp(emp_vo);
		
		if(vo == null) {
			session.setAttribute("emp_vo", null);
			rttr.addFlashAttribute("msg", false);
			System.out.println("emp_vo1 실패시 =" + vo);
		} else {
			session.setAttribute("emp_vo", vo);
			System.out.println("emp_vo2 성공시 =" + vo);
		}
	
		return "redirect:/";
		
	}
	//@PostMapping("/login") //로그인처리
	//public String login(HttpSession session) {
		//로그인처리
	//	session.setAttribute("emp_no", "emp_no");
	//	return "redirect:/base";
//	}
	
	@GetMapping("/logout") //로그아웃
	public String logout(HttpSession session) {
		session.invalidate(); //세션무효화
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping("/ajax/findId")
	public Map<String, Object> getInf(Model model,EmployeeVO vo) {
		Map<String,Object> map = new HashMap<>();
		vo = service.findId(vo);
		if(vo == null) {
			map.put("result", false);
		} else {
			map.put("result", true);
			map.put("employeeVO", vo);
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/findPw")
	public Map<String, Object> getPwd(Model model, EmployeeVO vo) {
		Map<String,Object> map = new HashMap<>();
		vo = service.findPw(vo);
		if(vo == null) {
			map.put("result", false);
		} else {
			map.put("result", true);
			map.put("employeeVO", vo);
		}
		return map;
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/ajax/loginList")
	 */
}
