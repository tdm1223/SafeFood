package com.edu.ssafy.dto;

import java.util.List;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String addr;
	private String phone;
	private List<String> allergy;
	private Eat eatList;

	public Member() {}

	public Member(String id, String pw, String name, String addr, String phone, List<String> allergy) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
		this.allergy = allergy;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public List<String> getAllergy() {
		return allergy;
	}

	public void setAllergy(List<String> selectList) {
		this.allergy = selectList;
	}

	public Eat getEatList() {
		return eatList;
	}

	public void setEatList(Eat eatList) {
		this.eatList = eatList;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", addr=" + addr + ", phone=" + phone
				+ ", allergy=" + allergy + ", eatList=" + eatList + "]";
	}
}
