package com.edu.ssafy.repository;

import java.util.LinkedList;
import java.util.List;

import com.edu.ssafy.dto.Allergy;
import com.edu.ssafy.dto.Dashboard;
import com.edu.ssafy.dto.Eat;
import com.edu.ssafy.dto.Cache;
import com.edu.ssafy.dto.Food;
import com.edu.ssafy.dto.Member;


public interface MemberDAO {
	/** 멤버 추가 */
	public void add(Member m);

	/** 아이디로 검색 */
	public Member searchById(String id);

	/** 로그인 */
	public Member logIn(String id, String pw);

	/** 삭제(탈퇴) */
	public void delete(String id, String pw);

	public void eatFood(int code, int quan, String id);

	public List<Eat> getEatList(String id);

	public void zzimFood(int code, String id);

	public List<Integer> getZzimList(String id);

	public void updateMember(Member m);

	public void delZzim(String id, int code);

	public String findPw(String id, String phone);

	public List<Allergy> getAllergyListAll();

	public void delFood(int code, int quan, String id);

	public List<Dashboard> getBoardData(String id, String range);

	public Cache getCache(String id);

	public void saveCache(String id, LinkedList<Food> tmp);
	
	public List<Food> updateRecommand(LinkedList<Food> tmp);
}
