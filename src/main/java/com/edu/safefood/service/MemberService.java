package com.edu.safefood.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.edu.safefood.dto.Allergy;
import com.edu.safefood.dto.Cache;
import com.edu.safefood.dto.Eat;
import com.edu.safefood.dto.Food;
import com.edu.safefood.dto.Member;

public interface MemberService {
	/** 멤버 추가 */
	public boolean add(Member m);

	/** 아이디로 검색 */
	public Member searchById(String id);

	/** 로그인 */
	public Member logIn(String id, String pw);

	/** 삭제(탈퇴) */
	public boolean delete(String id, String pw);

	public void eatFood(int code, int quan, String id);

	public List<Eat> getEatList(String id);

	public void zzimFood(int code, String id);

	public ArrayList<Integer> getZzimList(String id);

	public void update(Member m);

	public void delZzim(String id, int code);

	public String findPw(String id, String phone);

	public List<Allergy> getAllergyListAll();

	public void delFood(int code, int quan, String id);

	public void getMyData(ModelAndView m, String id, String range);

	public void addCache(String id, Food f);

	public Cache getCache(String id);

	public Map<String, Cache> getCache();

	public void setCache(Map<String, Cache> cache);

	public void saveCache(String id);

	public List<Food> getCurCache(String id);

	public void findMyDataCache(ModelAndView m, String id);
}
