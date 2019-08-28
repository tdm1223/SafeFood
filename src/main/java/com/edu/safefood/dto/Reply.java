package com.edu.safefood.dto;

public class Reply {
	private int rno;
	private int qno;
	private String id;
	private String firstdate;
	private String lastdate;
	private String text;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFirstdate() {
		return firstdate;
	}

	public void setFirstdate(String firstdate) {
		this.firstdate = firstdate;
	}

	public String getLastdate() {
		return lastdate;
	}

	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Reply [rno=");
		builder.append(rno);
		builder.append(", qno=");
		builder.append(qno);
		builder.append(", id=");
		builder.append(id);
		builder.append(", firstdate=");
		builder.append(firstdate);
		builder.append(", lastdate=");
		builder.append(lastdate);
		builder.append(", text=");
		builder.append(text);
		builder.append("]");
		return builder.toString();
	}

	public Reply(int rno, int qno, String id, String firstdate, String lastdate, String text) {
		super();
		this.rno = rno;
		this.qno = qno;
		this.id = id;
		this.firstdate = firstdate;
		this.lastdate = lastdate;
		this.text = text;
	}

	public Reply() {
		super();
	}

}
