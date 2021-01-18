
package com.hokwang.mobile.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hokwang.mobile.service.MainHeaderService;
import com.hokwang.vo.ParentVO;

@Controller
public class MainHeaderController {
	@Autowired
	MainHeaderService dao;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	
	@ResponseBody
	@RequestMapping("/ajax/logInAction")
	public boolean logInAction(ParentVO vo,HttpSession session) {
		System.out.println("ccccccccccc");
		vo = dao.logInAction(vo);
		if (vo != null) {
			session.setAttribute("parent_vo", vo);
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/registerAction")
	public boolean registerAction(ParentVO vo){
		System.out.println("암호화전 : "+vo);
		String inputPass = vo.getParent_pw();
		String pwd = pwdEncoder.encode(inputPass);
		String inputReg2 = vo.getParent_regno2();
		String reg2 = pwdEncoder.encode(inputReg2);
		vo.setParent_regno2(reg2);
		vo.setParent_pw(pwd);
		System.out.println("암호화후 : "+vo);
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
	
	@ResponseBody
	@RequestMapping("/ajax/checkId")
	public boolean checkId(ParentVO vo) {
		if(dao.checkId(vo) == null) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/checkEmail")
	public boolean checkEmail(ParentVO vo) {
		if(dao.checkEmail(vo) == null) {
			return true;
		}
		return false;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/alertInf")
	public List<Map<String,Object>> alertInf(ParentVO vo) {
		return dao.alertInf(vo);
	}
	
	
	
	
}
