package com.hokwang.mobile.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.hokwang.mobile.service.CoronaService;
import com.hokwang.mobile.service.MainHeaderService;
import com.hokwang.vo.ParentVO;

@Controller
public class KakaoLoginController {

	@Autowired
	MainHeaderService dao;
	
	@Autowired
	CoronaService corSvc;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	
	@RequestMapping(value = "/loginM", method = RequestMethod.GET)
	public ModelAndView memberLoginForm(HttpSession session) {
		ModelAndView mav = new ModelAndView(); /* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String kakaoUrl = KakaoAPI.getAuthorizationUrl(); /* 생성한 인증 URL을 View로 전달 */
		mav.setViewName("mobile/loginM"); 
		// mav.addObject("naver_url", naverAuthUrl); // 카카오 로그인
		mav.addObject("kakao_url",kakaoUrl);
		return mav;
	}

	@RequestMapping(value = "/kakao", produces = "application/json")
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView(); // 결과값을 node에 담아줌
		JsonNode node = KakaoAPI.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token"); // 사용자의 정보
		JsonNode userInfo = KakaoAPI.getKakaoUserInfo(accessToken);
		
		String kid = null;
		String kemail = null;
		String kname = null;
		String kimage = null; // 유저정보 카카오에서 가져오기 Get properties
		
		
		JsonNode id = userInfo.path("id");
		kid = id.asText();
		
		ParentVO vo = new ParentVO();
		vo.setParent_id(kid);
		
		vo = dao.checkId(vo);		
		
		if(vo != null) { //정보 이미 있다
			session.setAttribute("parent_vo", vo);
			mav.setViewName("mobile/main");
			List<Map<String, Object>> list = corSvc.getCorona();
			session.setAttribute("corona", list);	
		}
		else {
			JsonNode properties = userInfo.path("properties");
			JsonNode kakao_account = userInfo.path("kakao_account"); 
			kemail = kakao_account.path("email").asText();
			kname = properties.path("nickname").asText();
			kimage = properties.path("profile_image").asText();
			request.setAttribute("kid",id);
			request.setAttribute("kemail", kemail);
			request.setAttribute("kname", kname);
			request.setAttribute("kimage", kimage);
			
			mav.setViewName("mobile/registerKakao");
		}

		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/ajax/KakaoRegisterAction")
	public boolean KakaoRegisterAction(ParentVO vo){
		System.out.println("암호화전 : "+vo);
		String inputPass = vo.getParent_pw();
		String pwd = pwdEncoder.encode(inputPass);
		String inputReg2 = vo.getParent_regno2();
		String reg2 = pwdEncoder.encode(inputReg2);
		vo.setParent_regno2(reg2);
		vo.setParent_pw(pwd);
		System.out.println("암호화후 : "+vo);
		dao.kakaoRegisterAction(vo);
		return true;
	}
	
	
	
	
	
}
