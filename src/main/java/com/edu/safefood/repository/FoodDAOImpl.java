package com.edu.safefood.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.safefood.dto.Criteria;
import com.edu.safefood.dto.Food;

@Repository
public class FoodDAOImpl implements FoodDAO {
	@Autowired
	SqlSession session;

	// getList
	public List<Food> getList(Criteria cri, List<String> aller) {
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("startPage", cri.getStartPage());
			param.put("endPage", cri.getEndPage());
			return session.selectList("food.selectList", param);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override

	public List<Food> getList() {
		try {
			return session.selectList("food.selectList3");
		} catch (Exception e) {
			return null;
		}
	}

	// getFood by code
	public Food getFood(int code) {
		try {
			return session.selectOne("food.selectOne", code);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// insert food query
	public void insertFood(Food food) {
		try {
			session.insert("food.insert", food);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// delete food query
	public void delFood(int code) {
		try {
			session.delete("food.delete", code);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// search
	public List<Food> search(int type, String searchWord, int sort, Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchWord", searchWord);
		map.put("type", type);
		map.put("sortType", sort);
		map.put("startPage", cri.getStartPage());
		map.put("endPage", cri.getEndPage());
		try {
			switch (type) {
			case 1:
				return session.selectList("food.selectList2", map);
			case 2:
				return session.selectList("food.selectList2", map);
			case 3:
				return session.selectList("food.selectList2", map);
			default:
				return session.selectList("food.selectList2", map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public int totalCount() {
		try {
			return session.selectOne("food.selectCount");
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int searchTotalCount(int type, String searchWord) {
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("searchWord", searchWord);
			map.put("type", type);

			int rs = session.selectOne("food.selectTotalCount", map);

			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
