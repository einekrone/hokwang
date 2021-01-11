package com.hokwang.mobile.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoAPI {
   private final static String K_CLIENT_ID = "dfc27a931352b4dd4190cccdf60a57d0"; // "REST API키 "
   private final static String K_REDIRECT_URI = "http://localhost:808/hokwang/mobile"; // redirect uri

   public static String getAuthorizationUrl() {
      String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri="
            + K_REDIRECT_URI + "&response_type=code";
      return kakaoUrl;
   }

   public static JsonNode getAccessToken(String autorize_code) {
      final String RequestUrl = "https://kauth.kakao.com/oauth/token";
      final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
      postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID));
      postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI));

      postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값
      final HttpClient client = HttpClientBuilder.create().build();
      final HttpPost post = new HttpPost(RequestUrl);
      JsonNode returnNode = null;
      try {
         post.setEntity(new UrlEncodedFormEntity(postParams));
         final HttpResponse response = client.execute(post); // JSON 형태 반환값 처리
         ObjectMapper mapper = new ObjectMapper();
         System.out.println(response.getEntity().getContent());
         returnNode = mapper.readTree(response.getEntity().getContent());
         
 	    //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
         BufferedReader br = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
         String line = "";
         String result = "";
         
         while ((line = br.readLine()) != null) {
             result += line;
         }
         System.out.println("response body : " + result);
 		
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } 
      return returnNode;
   }

   public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
      final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
      final HttpClient client = HttpClientBuilder.create().build();
      final HttpPost post = new HttpPost(RequestUrl); // add header
      post.addHeader("Authorization", "Bearer " + accessToken);
      JsonNode returnNode = null;
      try {
         final HttpResponse response = client.execute(post); // JSON 형태 반환값 처리
         ObjectMapper mapper = new ObjectMapper();
         returnNode = mapper.readTree(response.getEntity().getContent());
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } 
      return returnNode;
   }
}