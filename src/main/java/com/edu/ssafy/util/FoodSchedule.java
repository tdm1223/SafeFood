package com.edu.ssafy.util;

import java.io.IOException;


import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


//@Component : root-config 에도 bean 등록하고 여기도 어노테이션 달아서 중복으로 빈이 생성되었다.
//@Aspect
public class FoodSchedule {
	private int n = 1;
	
/*	@Autowired
	SFoodParser ser;
	
	@Autowired
	nutSplit ser3;
	
	@Autowired
	foodBatch2 ser2;*/
	
//	@Scheduled(cron="*/3 * * * * *") 
	public void scheduleTest() throws IOException {
			
		//ser.parse();
//		ser2.getFoodAPI();
		
		n++;
	}
	
	
//	@Scheduled(cron="*/20 * * * * *") 
	public void addFood() throws IOException {
			
		//ser.parse();
//		ser3.insertFood();
		
		n++;
	}
}
