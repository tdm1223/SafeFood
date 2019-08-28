package com.edu.safefood.dto;

public class QnA {
	private int qno;
	private int qcode;
	private String id;
	private String title;
	private String content;
	private String firstdate;
	private String lastdate;
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public int getQcode() {
		return qcode;
	}

	public void setQcode(int qcode) {
		this.qcode = qcode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public QnA(int qno, int qcode, String id, String title, String content, String firstdate, String lastdate) {
		super();
		this.qno = qno;
		this.qcode = qcode;
		this.id = id;
		this.title = title;
		this.content = content;
		this.firstdate = firstdate;
		this.lastdate = lastdate;
	}

	public QnA() {
		super();
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("QnA [qno=");
		builder.append(qno);
		builder.append(", qcode=");
		builder.append(qcode);
		builder.append(", id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", firstdate=");
		builder.append(firstdate);
		builder.append(", lastdate=");
		builder.append(lastdate);
		builder.append(", description=");
		builder.append(description);
		builder.append("]");
		return builder.toString();
	}

}
