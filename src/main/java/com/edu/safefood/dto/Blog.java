package com.edu.safefood.dto;

public class Blog {
	String href;
	String src;
	String title;
	String regDate;
	String txt;
	String blogName;
	
	public Blog() {}
	
	public Blog(String href, String src, String title, String regDate, String txt, String blogName) {
		this.href = href;
		this.src = src;
		this.title = title;
		this.regDate = regDate;
		this.txt = txt;
		this.blogName = blogName;
	}

	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getTxt() {
		return txt;
	}
	public void setTxt(String txt) {
		this.txt = txt;
	}
	public String getBlogName() {
		return blogName;
	}
	public void setBlogName(String blogName) {
		this.blogName = blogName;
	}

	@Override
	public String toString() {
		return "Blog [href=" + href + ", src=" + src + ", title=" + title + ", regDate=" + regDate + ", txt=" + txt
				+ ", blogName=" + blogName + "]";
	}
	
}
