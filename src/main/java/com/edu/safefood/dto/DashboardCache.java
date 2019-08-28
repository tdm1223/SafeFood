package com.edu.safefood.dto;

import java.util.List;

public class DashboardCache {
	Dashboard total;
	List<Dashboard> data;
	
	public DashboardCache() {}
	
	public DashboardCache(Dashboard total, List<Dashboard> data) {
		this.total = total;
		this.data = data;
	}

	@Override
	public String toString() {
		return "DashboardCache [total=" + total + ", data=" + data + "]";
	}

	public Dashboard getTotal() {
		return total;
	}
	public void setTotal(Dashboard total) {
		this.total = total;
	}
	public List<Dashboard> getData() {
		return data;
	}
	public void setData(List<Dashboard> data) {
		this.data = data;
	}
	
	
}
