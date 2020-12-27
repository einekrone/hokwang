package com.hokwang.medi.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.hokwang.dao.MediMapper;
import com.hokwang.vo.MedicineVO;

@Controller
public class Medicontroller {
	@Autowired
	MediMapper dao;

	/*
	 * @RequestMapping("/medicine") public String medicine(Model model) { return
	 * "medicine"; }
	 */

	// 페이지이동하는
	@RequestMapping("/medicine")
	public ModelAndView diagForm(MedicineVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("medicine");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/mediAPI", produces = "application/text; charset=UTF-8")
	public String mediAPI(HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		RestTemplate rest = new RestTemplate();
		String encodedString = "9WNgCMAquzZlWmN4n%2Fn2noX%2FYPGO6FK5FMU8Jh0XgryTTRUlglPOn14fxnTwaL8CMtu2%2FEy3kglKLsnuxRCNgQ%3D%3D";
		String decodedString = null;
		try {
			decodedString = URLDecoder.decode(encodedString, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		rest.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));
		return rest.getForObject(
				"http://apis.data.go.kr/1471057/MdcinPrductPrmisnInfoService/getMdcinPrductIrdntItem?serviceKey="
						+ decodedString,
				String.class);
	}

	@ResponseBody
	@RequestMapping("/ajax/getMediList")
	public List<MedicineVO> getInfoList(Model model, MedicineVO vo) {
		return dao.getMediList();
	}

}
