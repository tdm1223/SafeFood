package com.edu.ssafy.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.ssafy.dto.Haccp;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

//@Service
public class foodBatch2 {
	
/*	@Autowired
	SFoodDAO SFDao;*/
	
	int pageNo = 88;
	int numOfRows = 100;

	String host = "http://apis.data.go.kr/B553748/CertImgListService/getCertImgListService";
	String api_key = "ovKtpwT9znh8rd%2FpIWwSW4tY2hYUeu8ZKDyw4QfqVQbLz8CvYjO3A%2BeD%2FOUC%2FjF1MjSVJP1n48xThcynyWDukA%3D%3D";
	String dataType = "json";

	public void getFoodAPI() {

		try {
				StringBuilder urlBuilder = new StringBuilder(host); 
				urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")+"="+api_key); 
				urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(pageNo), "UTF-8")); /* 페이지번호 */
				urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8")); /* 한 페이지 결과 수 */
				urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "=json"); 
				
				URL url = new URL(urlBuilder.toString());
			 	HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			    conn.setRequestMethod("GET");
			    conn.setRequestProperty("Content-type", "application/json");
			    
			    BufferedReader rd;
			    if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			        rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			    } else {
			        rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			    }
			    StringBuilder sb = new StringBuilder();
			    String line;
			    while ((line = rd.readLine()) != null) {
			        sb.append(line);
			    }
			    rd.close();
			    conn.disconnect();
			    
			    String res = sb.toString().replaceAll("null", "0");
			    
			    Gson gson = new Gson();
				JsonParser paser = new JsonParser();
				JsonElement rootObject = paser.parse(res)
						.getAsJsonObject().get("list");

		
				Type listType = new TypeToken<List<Haccp>>() {}.getType();
				List<Haccp> list = (List<Haccp>)gson.fromJson(rootObject, listType); 
								
//				SFDao.insertHaccp(list);			
				
				pageNo++;

		}catch(Exception e){
			e.printStackTrace();
			System.err.println(e.toString());
		}
	}
}
