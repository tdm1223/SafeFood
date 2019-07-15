package com.edu.ssafy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.edu.ssafy.dto.Allergy;
import com.edu.ssafy.dto.Dashboard;
import com.edu.ssafy.dto.DashboardCache;
import com.edu.ssafy.dto.Eat;
import com.edu.ssafy.dto.Food;
import com.edu.ssafy.dto.Member;
import com.edu.ssafy.repository.MemberDAO;
import com.edu.ssafy.dto.Cache;

@Service
public class MemberServiceImpl implements MemberService {
	Map<String, Cache> cache = new HashMap<String, Cache>();
	Map<String, DashboardCache> sessionCache = new HashMap<>();

	@Autowired
	private MemberDAO dao;

	@Override
	public boolean add(Member m) {
		try {
			dao.add(m);
			return true;
		} catch (Exception e) {
		}
		return false;
	}

	@Override
	public Member searchById(String id) {
		try {
			return dao.searchById(id);
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public Member logIn(String id, String pw) {
		try {
			return dao.logIn(id, pw);
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public boolean delete(String id, String pw) {
		try {
			dao.delete(id, pw);
			return true;
		} catch (Exception e) {
		}
		return false;
	}

	@Override
	public void eatFood(int code, int quan, String id) {
		try {
			dao.eatFood(code, quan, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Eat> getEatList(String id) {
		return dao.getEatList(id);
	}

	@Override
	public void zzimFood(int code, String id) {
		try {
			dao.zzimFood(code, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<Integer> getZzimList(String id) {
		return (ArrayList<Integer>) dao.getZzimList(id);
	}

	public void update(Member m) {
		dao.updateMember(m);
	}

	@Override
	public void delZzim(String id, int code) {
		dao.delZzim(id, code);
	}

	public String findPw(String id, String phone) {
		return dao.findPw(id, phone);
	}

	@Override
	public List<Allergy> getAllergyListAll() {
		return dao.getAllergyListAll();
	}

	@Override
	public void delFood(int eno, int quan, String id) {
		try {
			dao.delFood(eno, quan, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void findMyDataCache(ModelAndView m, String id) {
		DashboardCache cache = sessionCache.get(id);

		m.addObject("total", cache.getTotal());
		m.addObject("data", cache.getData());
		m.setViewName("index");
		return;
	}

	@Override
	public void getMyData(ModelAndView m, String id, String range) {
		List<Dashboard> data = dao.getBoardData(id, range);

		Dashboard total = new Dashboard();
		for (Dashboard d : data) {
			total.setCalory(Math.round((total.getCalory() + d.getCalory()) * 100) / 100.0);
			total.setCarbo(Math.round((total.getCarbo() + d.getCarbo()) * 100) / 100.0);
			total.setProtein(Math.round((total.getProtein() + d.getProtein()) * 100) / 100.0);
			total.setFat(Math.round((total.getFat() + d.getFat()) * 100) / 100.0);
			total.setSugar(Math.round((total.getSugar() + d.getSugar()) * 100) / 100.0);
			total.setNatrium(Math.round((total.getNatrium() + d.getNatrium()) * 100) / 100.0);
			total.setChole(Math.round((total.getChole() + d.getChole()) * 100) / 100.0);
			total.setFattyacid(Math.round((total.getFattyacid() + d.getFattyacid()) * 100) / 100.0);
			total.setTransfat(Math.round((total.getTransfat() + d.getTransfat()) * 100) / 100.0);
		}

		m.addObject("data", data);
		m.addObject("total", total);
		m.setViewName("index");

		DashboardCache cache = new DashboardCache(total, data);
		sessionCache.put(id, cache);
		return;
	}

	@Override
	public void addCache(String id, Food f) {
		if (!cache.containsKey(id)) {
			Cache tmp = new Cache(3);
			cache.put(id, tmp);
		}
		cache.get(id).add(f);
	}

	@Override
	public Cache getCache(String id) {
		return dao.getCache(id);
	}

	public List<Food> getCurCache(String id) {
		LinkedList<Food> tmp = cache.get(id).getDq();
		if (tmp.size() == 0 || tmp == null) {
			return null;
		}
		List<String> aller = dao.searchById(id).getAllergy();

		List<Food> ans = dao.updateRecommand(tmp);

		if (aller == null) {
			return ans;
		} else {
			for (Food f : ans) {
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
			return ans;
		}
	}

	// service에 있는 cacheMap 가져옴
	public Map<String, Cache> getCache() {
		return cache;
	}

	public void setCache(Map<String, Cache> cache) {

		this.cache = cache;
	}

	@Override
	public void saveCache(String id) {
		LinkedList<Food> tmp = cache.get(id).getDq();
		if (tmp.size() == 0) {
			return;
		} else {
			dao.saveCache(id, tmp);
		}
	}

}
