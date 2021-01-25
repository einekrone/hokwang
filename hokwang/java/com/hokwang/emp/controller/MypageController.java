package com.hokwang.emp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.service.EmployeeService;
import com.hokwang.vo.EmployeeVO;
import com.hokwang.vo.MessageVO;
import com.hokwang.vo.PaymentVO;
import com.hokwang.vo.TempmessageVO;



@Controller
public class MypageController {
	@Autowired
	EmployeeService dao;

	// 페이지이동
	@RequestMapping("/mypage") // .do 같은거
	public ModelAndView MypageForm(EmployeeVO empvo, Model model) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage");
		return mav;
	}

	// 등록페이지로 이동
	@GetMapping("/MypageInsert")
	public String MypageInsertForm() {
		return "user/insert";
	}

	@ResponseBody
	@RequestMapping("/ajax/getCountMsg")
	public int getCountMsg(Model model, EmployeeVO vo) {
		return dao.getCountMsg(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/showNotReadMsg")
	public List<MessageVO> showNotReadMsg(Model model, EmployeeVO vo) {
		return dao.showNotReadMsg(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/updateInf")
	public boolean updateInf(EmployeeVO vo, HttpSession session) {
		vo.setEmp_no(((EmployeeVO) session.getAttribute("emp_vo")).getEmp_no());
		System.out.println(vo);
		if (((EmployeeVO) session.getAttribute("emp_vo")).getEmp_pwd().equals(vo.getEmp_pwd1())) {
			if (dao.updateInf(vo) == 1) {

				return true;
			}
		} else {
			System.out.println("실패 비밀번호 확인");

		}
		return false;
	}

	@ResponseBody
	@RequestMapping("/ajax/getTotalMsg")
	public List<MessageVO> getTotalMsg(Model model, EmployeeVO vo) {
		return dao.getTotalMsg(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/noReadTotalMsg")
	public List<MessageVO> noReadTotalMsg(Model model, EmployeeVO vo) {
		return dao.noReadTotalMsg(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/AllCntMsg")
	public Map<String, Object> AllCntMsg(Model model, EmployeeVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noread", dao.getCountMsg(vo));
		map.put("total", dao.getTotalCountMsg(vo));
		map.put("temp", dao.tempCountMsg(vo));
		map.put("send", dao.sendCountMsg(vo));
		map.put("empInf", dao.selectEmpInf(vo));
		return map;
	}

	@ResponseBody
	@RequestMapping("/ajax/sendMsgInf")
	public boolean sendMsgInf(Model model, MessageVO vo) {
		dao.sendMsgInf(vo);
		return true;
	}

	@ResponseBody
	@RequestMapping("/ajax/tempMsgInf")
	public boolean tempMsgInf(Model model, TempmessageVO vo) {
		dao.tempMsgInf(vo);
		return true;
	}

	@ResponseBody
	@RequestMapping("/ajax/checkTemp")
	public TempmessageVO checkTemp(Model model, TempmessageVO vo) {
		TempmessageVO resultvo = new TempmessageVO();
		vo = dao.checkTemp(vo);
		if (vo == null) {
			return resultvo;// 빈거
		} else {
			return vo;// 든거
		}
	}

	// 등록처리
	@ResponseBody
	@RequestMapping("/ajax/updateImg")
	public boolean updateImg(HttpSession session,HttpServletRequest request, EmployeeVO vo) throws IllegalStateException, IOException {
		// request multipart로 캐스팅
		vo.setEmp_no(((EmployeeVO) session.getAttribute("emp_vo")).getEmp_no());
		vo.setEmp_name(((EmployeeVO) session.getAttribute("emp_vo")).getEmp_name());
		
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		// 이미지파일
		MultipartFile multipartFile = multipartRequest.getFile("uf");
		if (!multipartFile.isEmpty() && multipartFile.getSize() > 0) {
			String path = request.getSession().getServletContext().getRealPath("/resources/img");
			System.out.println("path=" + path);
			multipartFile.transferTo(new File(path, multipartFile.getOriginalFilename()));
			vo.setEmp_profile(multipartFile.getOriginalFilename());
		}
		dao.updateImg(vo);
		return true;
	}

	@ResponseBody
	@RequestMapping("/ajax/sendTotalInf")
	public List<MessageVO> sendTotalInf(Model model, EmployeeVO vo) {
		List<MessageVO> list = new ArrayList<MessageVO>();
		list = dao.sendTotalInf(vo);
		System.out.println("+++++" + list.get(0).getMsg_no());
		return list;
	}

	@ResponseBody
	@RequestMapping("/ajax/tempTotalMsg")
	public List<TempmessageVO> tempTotalMsg(Model model, EmployeeVO vo) {
		return dao.tempTotalMsg(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/checkFinal")
	public MessageVO checkFinal(Model model, MessageVO vo) {
		dao.updateYn(vo);
		return dao.checkFinal(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/checkTempFinal")
	public TempmessageVO checkTempFinal(Model model, TempmessageVO vo) {
		return dao.checkTempFinal(vo);
	}

	@ResponseBody
	@RequestMapping("/ajax/deleteMsg")
	public boolean deleteMsg(Model model, MessageVO vo) {
		dao.deleteMsg(vo);
		return true;
	}

	// 단건조회
	@ResponseBody
	@RequestMapping(value = "/ajax/selectempl")
	public EmployeeVO selectempl(EmployeeVO vo, Model model,HttpSession session) {
		vo = dao.selectempl(vo);
		session.setAttribute("emp_vo", vo);
		return vo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajax/updateFinal")
	public EmployeeVO updateFinal(EmployeeVO vo, Model model,HttpSession session) {
		System.out.println("사원 이름 :" + vo.getEmp_name());
		dao.updateImg(vo);
		session.setAttribute("emp_vo", vo);
		return vo;
	}
	
	
	@ResponseBody
	@RequestMapping("/ajax/oneSales")
	public Map<String, Object> getCountResv(Model model, EmployeeVO vo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resv", dao.getCountResv(vo));
		map.put("day", dao.getDaySales(vo));
		map.put("month", dao.getMonthSales(vo));
		return map;
	}
	
	
	
	

}