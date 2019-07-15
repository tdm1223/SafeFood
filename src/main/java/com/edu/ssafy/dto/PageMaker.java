package com.edu.ssafy.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	private int totalCnt;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10;
	private Criteria cri;
	
	public void setCri(Criteria cri){
		this.cri = cri;
	}
	
	public Criteria getCri(){
		return this.cri;
	}
	
	public void setTotalCnt(int totalCnt){
		this.totalCnt = totalCnt;
		
		calcData();
	}
	
	public int getTotalCnt() {
		return totalCnt;
	}
	
	private void calcData(){
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum); // 10 
		
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int)(Math.ceil(totalCnt / (double)cri.getPerPageNum()));  //   44/10 = 4.x
		if(endPage > tempEndPage) endPage = tempEndPage;
		
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCnt ? false : true;
	}
	
	public String makeQuery(int page){
		UriComponents uriComponents = 
		
		UriComponentsBuilder.newInstance()
			.queryParam("page", page)
			.queryParam("perPageNum", cri.getPerPageNum())
			.build();
		
		return uriComponents.toUriString();
	}
	
	public int getStartPage(){
		return this.startPage;
	}
	
	public int getEndPage(){
		return this.endPage;
	}
	
	public boolean getPrev(){
		return this.prev;
	}
	
	public boolean getNext(){
		return this.next;
	}
	
	
}
