package com.edu.safefood.dto;

public class Haccp {
	private int hno;
	private String nutrient;
	private String rawmtrl;
	private String prdlstNm;
	private String imgurl1;
	private String imgurl2;
	private String barcode;
	private String productGb;
	private String seller;
	private String prdkindstate;
	private String manufacture;
	private String prdkind;
	private String capacity;
	private String prdlstReportNo;
	private String allergy;
	private FoodNutriment nutList;
	
	public Haccp() {}
	

	public Haccp(int hno, String nutrient, String rawmtrl, String prdlstNm, String imgurl1, String imgurl2,
			String barcode, String productGb, String seller, String prdkindstate, String manufacture, String prdkind,
			String capacity, String prdlstReportNo, String allergy) {
		this.hno = hno;
		this.nutrient = nutrient;
		this.rawmtrl = rawmtrl;
		this.prdlstNm = prdlstNm;
		this.imgurl1 = imgurl1;
		this.imgurl2 = imgurl2;
		this.barcode = barcode;
		this.productGb = productGb;
		this.seller = seller;
		this.prdkindstate = prdkindstate;
		this.manufacture = manufacture;
		this.prdkind = prdkind;
		this.capacity = capacity;
		this.prdlstReportNo = prdlstReportNo;
		this.allergy = allergy;
	} 
	

	public FoodNutriment getNutList() {
		return nutList;
	}

	public void setNutList(FoodNutriment nutList) {
		this.nutList = nutList;
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public String getNutrient() {
		return nutrient;
	}

	public void setNutrient(String nutrient) {
		this.nutrient = nutrient;
	}

	public String getRawmtrl() {
		return rawmtrl;
	}

	public void setRawmtrl(String rawmtrl) {
		this.rawmtrl = rawmtrl;
	}

	public String getPrdlstNm() {
		return prdlstNm;
	}

	public void setPrdlstNm(String prdlstNm) {
		this.prdlstNm = prdlstNm;
	}

	public String getImgurl1() {
		return imgurl1;
	}

	public void setImgurl1(String imgurl1) {
		this.imgurl1 = imgurl1;
	}

	public String getImgurl2() {
		return imgurl2;
	}

	public void setImgurl2(String imgurl2) {
		this.imgurl2 = imgurl2;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getProductGb() {
		return productGb;
	}

	public void setProductGb(String productGb) {
		this.productGb = productGb;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getPrdkindstate() {
		return prdkindstate;
	}

	public void setPrdkindstate(String prdkindstate) {
		this.prdkindstate = prdkindstate;
	}

	public String getManufacture() {
		return manufacture;
	}

	public void setManufacture(String manufacture) {
		this.manufacture = manufacture;
	}

	public String getPrdkind() {
		return prdkind;
	}

	public void setPrdkind(String prdkind) {
		this.prdkind = prdkind;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getPrdlstReportNo() {
		return prdlstReportNo;
	}

	public void setPrdlstReportNo(String prdlstReportNo) {
		this.prdlstReportNo = prdlstReportNo;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}


	@Override
	public String toString() {
		return "Haccp [hno=" + hno + ", nutrient=" + nutrient + ", rawmtrl=" + rawmtrl + ", prdlstNm=" + prdlstNm
				+ ", imgurl1=" + imgurl1 + ", imgUrl2=" + imgurl2 + ", barcode=" + barcode + ", productGb=" + productGb
				+ ", seller=" + seller + ", prdkindstate=" + prdkindstate + ", manufacture=" + manufacture
				+ ", prdkind=" + prdkind + ", capacity=" + capacity + ", prdlstReportNo=" + prdlstReportNo
				+ ", allergy=" + allergy + "]";
	}
}
