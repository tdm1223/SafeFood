package com.edu.safefood.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;

import com.edu.safefood.dto.NaverSearchObject;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class NaverSearch {
	
	private final String clientId = "6Egjw1XhVcO_Ex1A9fwT";// 애플리케이션 클라이언트 아이디값";
	private final String clientSecret = "tkxYWKBVTK";// 애플리케이션 클라이언트 시크릿값";\

	public List<NaverSearchObject> search(String query) throws IOException {      
        StringBuilder sb = new StringBuilder();
        
        int display = 10; // 검색결과갯수. 최대100개
        
        try {
            String text = URLEncoder.encode(query, "utf-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog.json?query=" + text + "&display=" + display + "&start="+15;
 
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { 
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { 
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            sb = new StringBuilder();
            String line;
 
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }
            br.close();
            con.disconnect();
            
            Gson gson = new Gson();
            JsonParser parser = new JsonParser();
            JsonElement rootObejct = parser.parse(sb.toString().replaceAll("<b>", "").replaceAll("</b>", ""))
                    .getAsJsonObject().get("items");

            //배열에 담는것도 가능
            NaverSearchObject[] example = gson.fromJson(rootObejct, NaverSearchObject[].class);
            List<NaverSearchObject> list = Arrays.asList(example); //이런식으로 가능
            
            return list;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return null;
	}
}
