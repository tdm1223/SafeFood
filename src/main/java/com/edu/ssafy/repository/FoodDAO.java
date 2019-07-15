package com.edu.ssafy.repository;

import java.util.List;

import com.edu.ssafy.dto.Criteria;
import com.edu.ssafy.dto.Food;

public interface FoodDAO {
	public List<Food> getList(Criteria cri, List<String> id);

	public List<Food> getList();

	public void delFood(int id);

	public List<Food> search(int type, String searchWord, int sort, Criteria cri);

	public int totalCount();

	public Food getFood(int code);

	public int searchTotalCount(int type, String searchWord);

}
