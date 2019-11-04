package com.edu.safefood.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.safefood.dto.Cache;
import com.edu.safefood.dto.Eat;
import com.edu.safefood.dto.Food;
import com.edu.safefood.dto.Member;
import com.edu.safefood.service.FoodService;
import com.edu.safefood.service.MemberService;
import com.google.gson.JsonParser;

@Controller
@RequestMapping("member")
public class MemberController {

	@Autowired
	MemberService memService;

	@Autowired
	FoodService foodService;

	Map<String, Cache> cache = new HashMap<String, Cache>();

	@RequestMapping(value = "/deleteEat")
	public ModelAndView deleteEat(HttpServletRequest req, ModelAndView m, HttpSession session,
			@RequestParam("eno") int eno, @RequestParam("quan") int quan) {
		String id = (String) session.getAttribute("id");
		memService.delFood(eno, quan, id);
		session.setAttribute("update", true);
		m.setViewName("redirect:/member/myEat");
		return m;
	}

	@RequestMapping(value = "/FindPw", method = RequestMethod.GET)
	public String findPassword() {
		return "FindPassword";
	}

	@RequestMapping(value = "/FindPw", method = RequestMethod.POST)
	public ModelAndView findPassword(ModelAndView m, @RequestParam("id") String id,
			@RequestParam("phone") String phone) {

		String result = memService.findPw(id, phone);

		if (!result.equals("")) {
			m.addObject("pwd", result);
			m.setViewName("FindPwResult");
		} else {
			m.addObject("msg", "아이디와 핸드폰 번호를 다시 한번 확인해 주세요.");
			m.setViewName("error");
		}

		return m;
	}

	@RequestMapping("/myEat")
	public ModelAndView myEat(ModelAndView model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		Member m = memService.searchById(id);
		List<Eat> temp = memService.getEatList(m.getId());
		if (id != null) {
			for (Food f : foodService.getList()) {
				for (Eat e : temp) {
					if (f.getCode() == e.getCode()) {
						e.setFood(f);
					}
				}
			}
			model.addObject("eatList", temp);
			model.setViewName("myEat");

		} else {
			model.addObject("msg", "로그인 정보 없음");
			model.setViewName("error");
		}

		return model;
	}

	@RequestMapping("/zzim")
	public ModelAndView zzim(ModelAndView model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		ArrayList<Food> zzimList = new ArrayList<Food>();
		ArrayList<Integer> tmp = memService.getZzimList(id);

		if (id != null) {
			for (Food f : foodService.getList()) {
				for (Integer i : tmp) {
					if (f.getCode() == i) {
						zzimList.add(f);
					}
				}
			}

			model.addObject("zzimList", zzimList);
			model.setViewName("zzim");
		} else {
			model.addObject("msg", "로그인 정보 없음");
			model.setViewName("error");
		}
		return model;
	}

	@RequestMapping("/zzimDelete")
	public String deleteZzim(@RequestParam("code") int code, HttpSession session) {
		String id = (String) session.getAttribute("id");
		memService.delZzim(id, code);

		return "redirect:/member/zzim";
	}

	@RequestMapping(value = "/addZzim", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addZzim(@RequestBody String req) {
		HashMap<String, Object> entity = new HashMap<>();

		JsonParser paser = new JsonParser();

		String id = paser.parse(req).getAsJsonObject().get("id").toString().replace("\"", " ").trim();
		String code = paser.parse(req).getAsJsonObject().get("code").toString().replace("\"", " ").trim();

		Food cacheFood = foodService.getFood(Integer.parseInt(code));
		memService.addCache(id, cacheFood);

		try {
			memService.zzimFood(Integer.parseInt(code), id);
			entity.put("msg", "update success");

		} catch (Exception e) {
			entity.put("msg", "update fail");
		}

		return entity;
	}

	@RequestMapping(value = "/addFood", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addFood(@RequestBody String req, HttpSession ss) {
		HashMap<String, Object> entity = new HashMap<>();
		JsonParser paser = new JsonParser();

		String id = paser.parse(req).getAsJsonObject().get("id").toString().replace("\"", " ").trim();
		String quan = paser.parse(req).getAsJsonObject().get("quan").toString().replace("\"", " ").trim();
		String code = paser.parse(req).getAsJsonObject().get("code").toString().replace("\"", " ").trim();

		Food cacheFood = foodService.getFood(Integer.parseInt(code));
		memService.addCache(id, cacheFood);

		try {
			memService.eatFood(Integer.parseInt(code), Integer.parseInt(quan), id);
			ss.setAttribute("update", true);
			entity.put("msg", "update success");

		} catch (Exception e) {
			entity.put("msg", "update fail");
		}

		return entity;
	}

	@RequestMapping("/delPage")
	public String delPage() {
		return "delPage";
	}

	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView model, HttpSession session, @RequestParam("id") String id,
			@RequestParam("pwd") String pwd) {

		if (memService.logIn(id, pwd) == null) {
			model.addObject("msg", "아이디 또는 패스워드가 다릅니다");
			model.setViewName("error");
		} else {
			if (memService.delete(id, pwd)) {
				model.addObject("msg", "정상적으로 탈퇴되었습니다.");
				session.invalidate();
				model.setViewName("result");
			} else {
				model.addObject("msg", "삭제오류");
				model.setViewName("error");
			}
		}

		return model;
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView update(ModelAndView model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		Member m = memService.searchById(id);

		try {
			if (m != null) {
				model.addObject("member", m);
				List<String> aller = m.getAllergy();

				StringBuilder sb = new StringBuilder();

				if (aller.size() != 0) {
					for (int i = 0; i < aller.size() - 1; i++) {
						sb.append(aller.get(i)).append(", ");
					}
					sb.append(aller.get(aller.size() - 1));
				}

				model.addObject("haveAller", aller);
				model.addObject("allergy", sb.toString());
				model.addObject("allergins", memService.getAllergyListAll());
				model.setViewName("myPage");
			} else {
				model.addObject("msg", "로그인 정보 없음");
				model.setViewName("error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return model;
	}

	/**
	 * - Jackson이 return값 json으로 바꿔주는데 map밖에 못바꾸는듯? - 프론트에서 보낼 때 contentType:
	 * application/json으로 명시하고 - RequestBody로 받으려면 data에 JSON.stringify 처리 반드시 해줘야
	 * 한다. - DTO에 serializeble 안해줘도 requestbody 매핑은 된다. 단, json으로 보낼 때 객체를 넘기는게 아니라
	 * 변수만 넘겨야 된다. 변수가 객체의 변수보다 적어도 맞는 값만 매칭시켜 준다.
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(@RequestBody Member member) {
		HashMap<String, Object> entity = new HashMap<>();

		try {
			memService.update(member);
			entity.put("msg", "update success");

		} catch (Exception e) {
			entity.put("msg", "update fail");
		}

		return entity;
	}
}
