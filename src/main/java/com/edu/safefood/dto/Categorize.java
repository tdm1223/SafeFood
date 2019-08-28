package com.edu.safefood.dto;

public class Categorize {
	private int qcode;
	private String description;

	public Categorize(int qcode, String description) {
		super();
		this.qcode = qcode;
		this.description = description;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Categorize [qcode=");
		builder.append(qcode);
		builder.append(", description=");
		builder.append(description);
		builder.append("]");
		return builder.toString();
	}

	public int getQcode() {
		return qcode;
	}

	public void setQcode(int qcode) {
		this.qcode = qcode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Categorize() {
		super();
	}

}
