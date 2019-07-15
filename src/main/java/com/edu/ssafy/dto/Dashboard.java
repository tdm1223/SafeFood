package com.edu.ssafy.dto;

public class Dashboard {
	private String edate;
	private double calory;
	private double carbo;
	private double protein;
	private double fat;
	private double sugar;
	private double natrium;
	private double chole;
	private double fattyacid;
	private double transfat;
	
	public Dashboard() {}

	public Dashboard(String edate, double calory, double carbo, double protein, double fat, double sugar,
			double natrium, double chole, double fattyacid, double transfat) {
		this.edate = edate;
		this.calory = calory;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.natrium = natrium;
		this.chole = chole;
		this.fattyacid = fattyacid;
		this.transfat = transfat;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public double getCalory() {
		return calory;
	}

	public void setCalory(double calory) {
		this.calory = calory;
	}

	public double getCarbo() {
		return carbo;
	}

	public void setCarbo(double carbo) {
		this.carbo = carbo;
	}

	public double getProtein() {
		return protein;
	}

	public void setProtein(double protein) {
		this.protein = protein;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public double getSugar() {
		return sugar;
	}

	public void setSugar(double sugar) {
		this.sugar = sugar;
	}

	public double getNatrium() {
		return natrium;
	}

	public void setNatrium(double natrium) {
		this.natrium = natrium;
	}

	public double getChole() {
		return chole;
	}

	public void setChole(double chole) {
		this.chole = chole;
	}

	public double getFattyacid() {
		return fattyacid;
	}

	public void setFattyacid(double fattyacid) {
		this.fattyacid = fattyacid;
	}

	public double getTransfat() {
		return transfat;
	}

	public void setTransfat(double transfat) {
		this.transfat = transfat;
	}

	@Override
	public String toString() {
		return "{edate:" + edate + ", calory:" + calory + ", carbo:" + carbo + ", protein:" + protein
				+ ", fat:" + fat + ", sugar:" + sugar + ", natrium:" + natrium + ", chole:" + chole + ", fattyacid:"
				+ fattyacid + ", transfat:" + transfat + "}";
	}
	
	
}	
