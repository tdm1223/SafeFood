package com.edu.ssafy.dto;

import java.util.HashSet;
import java.util.LinkedList;

public class Cache {
	private String id;
	private int food1;
	private int food2;
	private int food3;
	private LinkedList<Food> dq = new LinkedList<Food>();
	private HashSet<Integer> map = new HashSet<Integer>();
	private int csize = 3;

	public Cache() {
	}

	public LinkedList<Food> getDq() {
		return dq;
	}

	public void setDq(LinkedList<Food> dq) {
		this.dq = dq;
	}

	public HashSet<Integer> getMap() {
		return map;
	}

	public void setMap(HashSet<Integer> map) {
		this.map = map;
	}

	public int getCsize() {
		return csize;
	}

	public void setCsize(int csize) {
		this.csize = csize;
	}

	public Cache(int csize) {
		this.csize = csize;
	}

	public void add(Food x) {
		// 캐시에 입력값이 없는 경우
		if (!map.contains(x.getCode())) {
			if (dq.size() == csize) {
				Food k = dq.removeFirst();
				map.remove(k.getCode());
			}
			dq.addLast(x);
			map.add(x.getCode());
		}
		// 캐시에 입력값이 있는 경우
		else {
			for (Food s : dq) {
				if (s.getCode() == x.getCode()) {
					dq.remove(s);
					break;
				}
			}
			dq.addLast(x);
		}
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getFood1() {
		return food1;
	}

	public void setFood1(int food1) {
		this.food1 = food1;
	}

	public int getFood2() {
		return food2;
	}

	public void setFood2(int food2) {
		this.food2 = food2;
	}

	public int getFood3() {
		return food3;
	}

	public void setFood3(int food3) {
		this.food3 = food3;
	}

}
