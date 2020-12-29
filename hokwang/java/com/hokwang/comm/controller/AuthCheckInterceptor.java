package com.hokwang.comm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

//Controller로 가기전에 로그인 여부 조건을 확인하는 interceptor
public class AuthCheckInterceptor implements HandlerInterceptor {

	
	// 세션에 loginInfo 속성이 존재하면 return true : 요청이 들어올때 마다 로그인 상태인지 확인하지 않아도 된다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//세션 객체 받기
		HttpSession session = request.getSession(false);
		//id가 비어있지 않으면 true 반환
		String id = (String)
				session.getAttribute("emp_no");
			if(id != null) {
				return true;
			}
		//아니라면 로그인 페이지로 이동.
		response.sendRedirect("/login");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("post 인터셉터");
	}


}
