package com.edu.safefood.dto;

public class Criteria {
	private int page;
	private int perPageNum;
	
	
	public Criteria(){
		this.page = 1;
		this.perPageNum = 12;
	}
	
	public int getPage() {return page;}
	public void setPage(int page) {this.page = page;}
	
	public int getPerPageNum() {return perPageNum;}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 99999) 
			this.perPageNum = 12;
	}
	
	public int getStartPage(){
		return (page-1) * perPageNum;
	}
	
	public int getEndPage(){
		return perPageNum;
	}
	
}
