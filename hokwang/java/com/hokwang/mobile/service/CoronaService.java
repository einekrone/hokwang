package com.hokwang.mobile.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

@Service
public class CoronaService {
	private static String CORONA_URL = "http://ncov.mohw.go.kr/bdBoardList_Real.do?brdId=1&brdGubun=13";

	public List<Map<String, Object>> getCorona() throws IOException {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map;
		Document doc = Jsoup.connect(CORONA_URL).userAgent(
				"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36").get();
		Elements contents = doc.select("table tbody tr");
		for (Element content : contents) {
			map = new HashMap<>();
			Elements tdContents = content.select("td");
			map.put("title", content.select("th").text()); // 합계, 지역명(시도명)
			map.put("beTotal", tdContents.get(0).text());// 전일대비증감(합계)
			map.put("total", tdContents.get(3).text());// 확진자(확진환자)
			map.put("death", tdContents.get(6).text());// 사망자
			map.put("inci", tdContents.get(7).text());// 발생률
			list.add(map);
		}
		return list;
	}
}
