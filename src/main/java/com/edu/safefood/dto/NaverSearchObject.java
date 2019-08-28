package com.edu.safefood.dto;

public class NaverSearchObject {
	String title;
	String link;
	String description;
	String bloggername;
	String postdate;
	
	
	@Override
	public String toString() {
		return "NaverSearch [title=" + title + ", link=" + link + ", description=" + description + ", bloggername="
				+ bloggername + ", postdate=" + postdate + "]";
	}

	public NaverSearchObject(String title, String link, String description, String bloggername, String postdate) {
		super();
		this.title = title;
		this.link = link;
		this.description = description;
		this.bloggername = bloggername;
		this.postdate = postdate;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBloggername() {
		return bloggername;
	}
	public void setBloggername(String bloggername) {
		this.bloggername = bloggername;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	
	
}
