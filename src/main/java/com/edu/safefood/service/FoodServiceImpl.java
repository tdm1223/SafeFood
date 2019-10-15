package com.edu.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.safefood.dto.Criteria;
import com.edu.safefood.dto.Food;
import com.edu.safefood.repository.FoodDAO;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	private FoodDAO dao;

	@Override
	public List<Food> getList(Criteria cri, List<String> aller) {
		try {
			if (aller == null) {
				return dao.getList(cri, null);
			} else {
				List<Food> list = dao.getList(cri, aller);
				for (Food f : list) {
					for (String allergy : aller) {
						// 알레르기 포함하고있다면
						if (f.getMaterial().contains(allergy) || f.getAllergy().contains(allergy)) {
							f.setIsAllergy(true);
						}
					}
				}
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Food> getList() {
		try {
			return dao.getList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean delFood(int id) {
		try {
			dao.delFood(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Food> search(int type, String searchWord, int sort, Criteria cri, List<String> aller) {
		try {
			if (aller == null) {
				return dao.search(type, searchWord, sort, cri);
			} else {
				List<Food> list = dao.search(type, searchWord, sort, cri);
				for (Food f : list) {
					for (String allergy : aller) {
						// 알레르기 포함하고있다면
						if (f.getMaterial().contains(allergy)) {
							f.setIsAllergy(true);
						}
						if (f.getAllergy().contains(allergy)) {
							f.setIsAllergy(true);
						}
					}
				}
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Food getFood(int code) {
		try {
			return dao.getFood(code);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int totalCount() {
		try {
			return dao.totalCount();
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public int searchTotalCount(int type, String searchWord) {
		try {
			return dao.searchTotalCount(type, searchWord);
		} catch (Exception e) {
			return 0;
		}
	}

}
