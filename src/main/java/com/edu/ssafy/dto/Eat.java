package com.edu.ssafy.dto;

public class Eat {
	private int eno;
	private int code;
	private int quan;
	private String edate;
	private Food food;
	
	public Eat() {}
	
	public Eat(int code, int quan) {
		this.code = code;
		this.quan = quan;
	}
	
	public Eat(int eno, int code, int quan, String edate, Food food) {
		this.eno = eno;
		this.code = code;
		this.quan = quan;
		this.edate = edate;
		this.food = food;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getQuan() {
		return quan;
	}

	public void setQuan(int quan) {
		this.quan = quan;
	}

	@Override
	public String toString() {
		return "Eat [eno=" + eno + ", code=" + code + ", quan=" + quan + ", edate=" + edate + "]";
	}
}
