package com.edu.safefood.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.safefood.dto.Allergy;
import com.edu.safefood.dto.Cache;
import com.edu.safefood.dto.Dashboard;
import com.edu.safefood.dto.Eat;
import com.edu.safefood.dto.Food;
import com.edu.safefood.dto.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession ss;

	@Autowired
	FoodDAO dao;

	@Override
	public void add(Member m) {
		try {
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("id", m.getId());
			params.put("pw", m.getPw());
			params.put("name", m.getName());
			params.put("addr", m.getAddr());
			params.put("phone", m.getPhone());

			ss.insert("mem.addMember", params);

			// 알러지 정보 입력
			List<String> allergys = m.getAllergy();

			for (int i = 0; i < allergys.size(); i++) {
				HashMap<String, String> params2 = new HashMap<String, String>();
				params2.put("code", allergys.get(i));
				params2.put("id", m.getId());
				ss.insert("mem.addAllergy", params2);
			}
			return;
		} catch (Exception e) {

		}
	}

	@Override
	public Member logIn(String id, String pw) {
		Member m = ss.selectOne("mem.selectOne", id);
		if (m.getPw().equals(pw)) {
			return m;
		} else {
			// 로그인 오류
			return null;
		}
	}

	@Override
	public void delete(String id, String pw) {
		Member m = logIn(id, pw);
		ss.delete("mem.delete", m);
	}

	@Override
	public Member searchById(String id) {
		Member member = ss.selectOne("mem.selectById", id);

		List<Object> alist = ss.selectList("mem.getMemAllergy", id);
		List<String> allergyList = new ArrayList<String>();

		for (Object s : alist) {
			allergyList.add(String.valueOf(s));
		}

		member.setAllergy(allergyList);

		return member;
	}

	public void eatFood(int code, int quan, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("code", code);
		map.put("quan", quan);
		ss.insert("mem.eatFood", map);
	}

	public void zzimFood(int code, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("code", code);
		try {
			ss.insert("mem.zzimFood", map);
		} catch (Exception e) {
			return;
		}
	}

	@Override
	public List<Integer> getZzimList(String id) {
		return ss.selectList("mem.getZzimList", id);
	}

	public void updateMember(Member m) {
		HashMap<String, Object> param = new HashMap<>();
		Member origin = searchById(m.getId());
		param.put("id", m.getId());

		if (m.getPw() != null && !origin.getPw().equals(m.getPw())) {
			param.put("pw", m.getPw());
		}

		if (m.getName() != null && !origin.getName().equals(m.getName())) {
			param.put("name", m.getName());
		}

		if (m.getAddr() != null && !origin.getAddr().equals(m.getAddr())) {
			param.put("addr", m.getAddr());
		}

		if (m.getPhone() != null && !origin.getPhone().equals(m.getPhone())) {
			param.put("phone", m.getPhone());
		}

		ss.delete("mem.delAllergy", origin.getId());

		// 알러지 정보 입력
		List<String> allergys = m.getAllergy();

		for (int i = 0; i < allergys.size(); i++) {
			HashMap<String, String> params2 = new HashMap<String, String>();
			params2.put("code", allergys.get(i));
			params2.put("id", m.getId());
			ss.insert("mem.addAllergy", params2);
		}

		return;
	}

	@Override
	public void delZzim(String id, int code) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("code", code);
		ss.delete("mem.delZzim", map);
	}

	public String findPw(String id, String phone) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("phone", phone);
		return ss.selectOne("mem.selectPw", map);
	}

	@Override
	public List<Eat> getEatList(String id) {
		try {
			List<Eat> eatList = ss.selectList("mem.eatList", id);
			return eatList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Allergy> getAllergyListAll() {
		List<Allergy> alList = ss.selectList("mem.allerList");
		return alList;
	}

	@Override
	public void delFood(int eno, int quan, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("eno", eno);
		map.put("quan", quan);
		int count = ss.selectOne("mem.eatCount", map);

		if (count > quan) {
			ss.update("mem.updateEat", map);
		} else {
			ss.delete("mem.delEat", map);
		}
	}

	@Override
	public Cache getCache(String id) {
		Cache tmp = ss.selectOne("mem.selectCache", id);
		if (tmp == null) {
			tmp = new Cache(3);
		} else {
			tmp.getMap().add(tmp.getFood1());
			tmp.getMap().add(tmp.getFood2());
			tmp.getMap().add(tmp.getFood3());

			tmp.getDq().add(dao.getFood(tmp.getFood1()));
			tmp.getDq().add(dao.getFood(tmp.getFood2()));
			tmp.getDq().add(dao.getFood(tmp.getFood3()));
		}

		return tmp;
	}

	@Override
	public void saveCache(String id, LinkedList<Food> tmp) {
		// DB에 저장 쿼리
		ss.delete("mem.deleteCache", id);
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("food1", tmp.get(0).getCode());
		params.put("food2", tmp.get(1).getCode());
		params.put("food3", tmp.get(2).getCode());
		params.put("id", id);
		ss.insert("mem.insertCache", params);
	}

	@Override
	public List<Dashboard> getBoardData(String id, String range) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("range", range);

		List<Dashboard> result = ss.selectList("mem.eatData", param);

		return result;
	}

	@Override
	public List<Food> updateRecommand(LinkedList<Food> tmp) {
		int num = (int) (Math.random() * 100 + 1);

		if (tmp.size() == 1) {
			num = 0;
		} else if (tmp.size() == 2) {
			if (num >= 50) {
				num = 0;
			} else {
				num = 1;
			}
		} else {
			switch (num % 10) {
			case 10:
			case 9:
			case 8:
			case 7:
			case 6:
			case 5:
				num = 2;
				break;
			case 4:
			case 3:
			case 2:
				num = 1;
				break;
			case 1:
			case 0:
				num = 0;
				break;
			}
		}

		Food f = tmp.get(num);
		String name = f.getName();
		String maker = f.getMakerName();
		double calory = f.getCalory();

		HashMap<String, Object> param = new HashMap<String, Object>();
		// 이름, 생산자, 칼로리기반 유사 검색
		param.put("name", name);
		param.put("maker", maker);
		param.put("calory", calory);
		return ss.selectList("mem.updateRecommand", param);
	}

}
