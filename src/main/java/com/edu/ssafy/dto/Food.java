package com.edu.ssafy.dto;

/** 식품 정보 */
public class Food implements Comparable<Food> {
	/** 식품을 구별하는 코드 */
	protected int code;
	/** 식품 이름 */
	protected String name;
	/** 이미지 경로 */
	protected String imgurl1;
	protected String imgurl2;
	/** 제조사 */
	protected String maker;

	/** 판매자 */
	protected String seller;
	/** 등록 연도 */
	protected String bgn_year;
	/** 알레르기 */
	protected String allergy;
	/** 원료 */
	protected String material;
	/** 용량 */
	protected String capacity;
	/** 일회 제공되는 칼로리 */
	protected double calory;
	/** 일회 제공되는 탄수화물 */
	protected double carbo;
	/** 일회 제공되는 단백질 */
	protected double protein;
	/** 일회 제공되는 지방 */
	protected double fat;
	/** 일회 제공되는 당류 */
	protected double sugar;
	/** 일회 제공되는 나트륨 */
	protected double natrium;
	/** 일회 제공되는 콜레스테롤 */
	protected double chole;
	/** 일회 제공되는 포화지방산 */
	protected double fattyacid;
	/** 일회 제공되는 트렌스지방 */
	protected double transfat;

	protected String makerName;
	protected String sellerName;

	protected boolean isAllergy;

	public boolean getisAllergy() {
		return isAllergy;
	}

	public void setIsAllergy(boolean isAllergy) {
		this.isAllergy = isAllergy;
	}

	public String getMakerName() {
		return makerName;
	}

	public void setMakerName(String makerName) {
		this.makerName = makerName;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Food [code=");
		builder.append(code);
		builder.append(", name=");
		builder.append(name);
		builder.append(", imgurl1=");
		builder.append(imgurl1);
		builder.append(", imgurl2=");
		builder.append(imgurl2);
		builder.append(", maker=");
		builder.append(maker);
		builder.append(", seller=");
		builder.append(seller);
		builder.append(", bgn_year=");
		builder.append(bgn_year);
		builder.append(", allergy=");
		builder.append(allergy);
		builder.append(", material=");
		builder.append(material);
		builder.append(", capacity=");
		builder.append(capacity);
		builder.append(", calory=");
		builder.append(calory);
		builder.append(", carbo=");
		builder.append(carbo);
		builder.append(", protein=");
		builder.append(protein);
		builder.append(", fat=");
		builder.append(fat);
		builder.append(", sugar=");
		builder.append(sugar);
		builder.append(", natrium=");
		builder.append(natrium);
		builder.append(", chole=");
		builder.append(chole);
		builder.append(", fattyacid=");
		builder.append(fattyacid);
		builder.append(", transfat=");
		builder.append(transfat);
		builder.append(", makerName=");
		builder.append(makerName);
		builder.append(", sellerName=");
		builder.append(sellerName);
		builder.append("]");
		return builder.toString();
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

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getBgn_year() {
		return bgn_year;
	}

	public void setBgn_year(String bgn_year) {
		this.bgn_year = bgn_year;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
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

	public Food(int code, String name, String imgurl1, String imgurl2, String maker, String seller, String bgn_year,
			String allergy, String material, String capacity, double calory, double carbo, double protein, double fat,
			double sugar, double natrium, double chole, double fattyacid, double transfat, String makerName,
			String sellerName, boolean isAllergy) {
		super();
		this.code = code;
		this.name = name;
		this.imgurl1 = imgurl1;
		this.imgurl2 = imgurl2;
		this.maker = maker;
		this.seller = seller;
		this.bgn_year = bgn_year;
		this.allergy = allergy;
		this.material = material;
		this.capacity = capacity;
		this.calory = calory;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.sugar = sugar;
		this.natrium = natrium;
		this.chole = chole;
		this.fattyacid = fattyacid;
		this.transfat = transfat;
		this.makerName = makerName;
		this.sellerName = sellerName;
		this.isAllergy = isAllergy;
	}

	public Food() {
		super();
	}

	@Override
	public int compareTo(Food o) {
		return this.code - o.code;
	}

}
