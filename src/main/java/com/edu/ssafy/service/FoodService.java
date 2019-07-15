package com.edu.ssafy.service;

import java.util.List;

import com.edu.ssafy.dto.Criteria;
import com.edu.ssafy.dto.Food;

public interface FoodService {
	public List<Food> getList(Criteria cri, List<String> id);

	public List<Food> getList();

	public boolean delFood(int id);

	public List<Food> search(int type, String searchWord, int sort, Criteria cri, List<String> aller);

	public Food getFood(int code);

	public int totalCount();

	public int searchTotalCount(int type, String searchWord);
}
