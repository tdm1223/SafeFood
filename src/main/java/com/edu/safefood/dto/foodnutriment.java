package com.edu.safefood.dto;

import java.util.ArrayList;


public class foodnutriment {
	private static final String[] serving = {
		"총 내용량",
		"1회 제공량",
		"1회제공량",
		"총 제공량"
	};
	
	private static final ArrayList<String> del = new ArrayList<>();
	static{
		del.add(" "); del.add(",");
		del.add("-"); del.add("/");
		del.add("_"); 
	}
	
	private static final String[] nutr = {   
			"",
		    "열량",
		    "탄수화물",
		    "단백질",
		    "지방",
		    "당류",
		    "나트륨",
		    "콜레스테롤",
		    "포화지방산",
		    "트랜스지방산"};
	private static StringBuilder sb = new StringBuilder();
	
	public String code;
	public int serving_wt;
	public double nutr_cont1;
	public double nutr_cont2;
	public double nutr_cont3;
	public double nutr_cont4;
	public double nutr_cont5;
	public double nutr_cont6;
	public double nutr_cont7;
	public double nutr_cont8;
	public double nutr_cont9;
	
	public foodnutriment() {};
	
	public foodnutriment(Haccp h, String nt) {
		this.code = Integer.toString(h.getHno());
		this.serving_wt = getservingwt(nt);
		this.nutr_cont1 = getnutr(nt,1);
		this.nutr_cont2 = getnutr(nt,2);
		this.nutr_cont3 = getnutr(nt,3);
		this.nutr_cont4 = getnutr(nt,4);
		this.nutr_cont5 = getnutr(nt,5);
		this.nutr_cont6 = getnutr(nt,6);
		this.nutr_cont7 = getnutr(nt,7);
		this.nutr_cont8 = getnutr(nt,8);
		this.nutr_cont9 = getnutr(nt,9);
	}
	
	public String getName(String addr) {
		String result = "";
		
		
		for(int i=0; i<addr.length(); i++) {
			if(addr.equals("알수없음") || addr.equals("알 수 없음")) {
				return "알수없음";
			}
			else if(del.contains(String.valueOf(addr.charAt(i)))) {
				result = addr.substring(0, i);
				break;
			}
		}
		
		return result.trim();
	}

	@Override
	public String toString() {
		return "foodnutriment [code=" + code + ", 제공량=" + serving_wt + ", 열량=" + nutr_cont1
				+ ", 탄수화물=" + nutr_cont2 + ", 단백질=" + nutr_cont3 + ", 지방=" + nutr_cont4
				+ ", 당류=" + nutr_cont5 + ", 나트륨=" + nutr_cont6 + ", 콜레스테롤=" + nutr_cont7
				+ ", 포화지방산=" + nutr_cont8 + ", 트랜스지방산=" + nutr_cont9 + "]";
	}

	private static double getnutr(String input,int index)
	{
		String gets[] = input.split(nutr[index]);
		
		if(gets.length==1)
		{
			return 0.0f;
		}
		
		String get = gets[1];
		int cur = 0;
		
		while(cur<get.length())
		{
			if(Character.isDigit(get.charAt(cur)))
			{
				break;
			}
			cur++;
		}
		sb.setLength(0);
		sb.append('0');
		boolean haveseendot = false;
		while(cur<get.length())
		{
			if(Character.isDigit(get.charAt(cur)))
			{
				sb.append(get.charAt(cur));
			}
			else if((get.charAt(cur)=='.'&&!haveseendot) || (get.charAt(cur)==',' && Character.isDigit(get.charAt(cur+1))))
			{
				sb.append('.');
				if(!haveseendot) haveseendot=true;
			}
			else
			{
				break;
			}	
			cur++;
		}
		return Double.parseDouble(sb.toString());
	}
	
	private static int getservingwt(String nutr)
	{
		String[] gets=null;
		for (String word : serving) {
			gets = nutr.split(word);
			if(gets.length!=1)
			{
				break;
			}				
		}
		
		if(gets==null || gets.length == 1)
		{
			return 0;
		}
		
		String get = gets[1];
		sb.setLength(0);
		sb.append('0');
		int cur = 0;
		
		while(cur<get.length())
		{
			if(Character.isDigit(get.charAt(cur)))
			{
				break;
			}
			cur++;
		}
		
		while(cur<get.length())
		{
			if(Character.isDigit(get.charAt(cur)))
			{
				sb.append(get.charAt(cur));
			}
			else
			{
				break;
			}	
			cur++;
		}
		return Integer.parseInt(sb.toString());
	}
}
