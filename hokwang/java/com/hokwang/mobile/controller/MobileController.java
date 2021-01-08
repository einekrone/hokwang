package com.hokwang.mobile.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hokwang.vo.ResvCalendar;

@Controller
public class MobileController {

	@RequestMapping(value = "/child")
	public String child() {
		return "mobile/childManage";
	}

	@RequestMapping(value = "/pay")
	public String pay() {
		return "mobile/payment";
	}

	@RequestMapping(value = "/doc")
	public String doc() {
		return "mobile/document";
	}

	@RequestMapping(value = "/resv")
	public String resv(HttpServletRequest request, Model model, HttpServletResponse response, ResvCalendar vo) {
//		DecimalFormat df = new DecimalFormat("00");
//		Calendar calendar;
		String type = request.getParameter("type");
		System.out.println("type : "+type);
		if(type == "prio") {
//			calendar = Calendar.getInstance();
//			DateFormat dft = new SimpleDateFormat("yyyy-mm-dd") ;
//			try {
//				calendar.setTime(dft.parse(new Date()));
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			String year = Integer.toString(calendar.get(Calendar.YEAR)); // 년도를 구한다
//			String month = df.format(calendar.get(Calendar.MONTH) + 1); // 달을 구한다
//			String day = df.format(calendar.get(Calendar.DATE)); // 날짜를 구한다

//			int lastDate = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);// 달 마지막 날
//			calendar.set(calendar.DAY_OF_MONTH, 1);
//			int iDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK); // 요일을 구한다
			
//			vo.setDay(day);
//			vo.setLastDate(lastDate);
//			vo.setIDayOfWeek(iDayOfWeek);
//			model.addAttribute("m_dat",day);
//			model.addAttribute("cal", vo);
		}
		model.addAttribute("resvType", type);
		return "mobile/reservation";
	}
}
