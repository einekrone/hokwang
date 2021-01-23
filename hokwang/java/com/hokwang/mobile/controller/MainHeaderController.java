
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
import com.hokwang.mobile.service.PaymentService;
import com.hokwang.vo.AlertVO;
import com.hokwang.vo.ParentVO;
import java.util.Random;

@Controller
public class MainHeaderController {

	private int pwdLength = 8;
	private final char[] passwordTable = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
			'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
			'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%',
			'^', '&', '*', '(', ')', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };

	public int getPwdLength() {
		return pwdLength;
	}

	public void setPwdLength(int pwdLength) {
		this.pwdLength = pwdLength;
	}

	@Autowired
	MainHeaderService dao;
	@Autowired
	PaymentService paydao;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@ResponseBody
	@RequestMapping("/ajax/deleteAlert")
	public boolean deleteAlert(AlertVO vo) {
		dao.deleteAlert(vo);
		return true;
	}

	@ResponseBody
	@RequestMapping("/ajax/logInAction")
	public boolean logInAction(ParentVO vo, HttpSession session) {

		if(dao.checkId(vo).getParent_temppw() != null) { //임시비밀번호가 발급된 계정
			if(dao.logInAction(vo) != null) {
				session.setAttribute("parent_vo",dao.logInAction(vo));
				System.out.println("임시비빌번호가 발급된 계정");
				return true;
			}
		}
		else {//임시비밀번호가 발급 안된 계정
			ParentVO vo2 = new ParentVO();
			vo2 = dao.checkId(vo);

			if (vo2 != null) {
				if (pwdEncoder.matches(vo.getParent_pw(), vo2.getParent_pw()) == true) {
					session.setAttribute("parent_vo", vo2);
					paydao.CheckProcedure(vo2);
					return true;
				}
			}			
		}
		

		return false;
	}

	@ResponseBody
	@RequestMapping("/ajax/registerAction")
	public boolean registerAction(ParentVO vo) {
		System.out.println("암호화전 : " + vo);
		String inputPass = vo.getParent_pw();
		String pwd = pwdEncoder.encode(inputPass);
		String inputReg2 = vo.getParent_regno2();
		String reg2 = pwdEncoder.encode(inputReg2);
		vo.setParent_regno2(reg2);
		vo.setParent_pw(pwd);
		System.out.println("암호화후 : " + vo);
		dao.registerAction(vo);
		return true;
	}

	@ResponseBody
	@RequestMapping("/ajax/alertCntAction")
	public int alertCntAction(ParentVO vo) {
		return dao.alertCntAction(vo);
	}

	@GetMapping("/logoutM") // 로그아웃
	public String logoutM(HttpSession session) {
		session.invalidate(); // 세션무효화
		return "redirect:/mobile";
	}

	@ResponseBody
	@RequestMapping("/ajax/checkId")
	public boolean checkId(ParentVO vo) {
		if (dao.checkId(vo) == null) {
			return true;
		}
		return false;
	}

	@ResponseBody
	@RequestMapping("/ajax/checkEmail")
	public boolean checkEmail(ParentVO vo) {
		if (dao.checkEmail(vo) == null) {
			return true;
		}
		return false;
	}

	@ResponseBody
	@RequestMapping("/ajax/alertInf")
	public List<Map<String, Object>> alertInf(ParentVO vo) {
		System.out.println("점검" + dao.alertInf(vo));
		return dao.alertInf(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/findIdInf")
	public String findIdInf(ParentVO vo) {
		String result;
		vo = dao.findIdInf(vo);
		if (vo != null) {
			result = vo.getParent_id();
		} else {
			result = "";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("/ajax/findPwInf")
	public String findPwInf(ParentVO vo) {
		String result;
		ParentVO vo2 = new ParentVO();
		vo2 = dao.findPwInf(vo);
		if (vo2 != null) {
			Random random = new Random(System.currentTimeMillis());
			int tablelength = passwordTable.length;
			StringBuffer buf = new StringBuffer();

			for (int i = 0; i < pwdLength; i++) {
				buf.append(passwordTable[random.nextInt(tablelength)]);
			}

			// 맞는 계정
			result = buf.toString();
			System.out.println("임시비밀번호:" + result);
			vo.setParent_temppw(result);
			dao.changeTempPw(vo);
		} else {
			result = "";
		}
		return result;
	}

}
