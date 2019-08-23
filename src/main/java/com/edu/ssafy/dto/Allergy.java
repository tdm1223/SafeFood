package com.edu.ssafy.dto;

public class Allergy {
	int code;
	String name;

	public Allergy() {
	}

	public Allergy(int code, String name) {
		this.code = code;
		this.name = name;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Allergy [code=" + code + ", name=" + name + "]";
	}
}
