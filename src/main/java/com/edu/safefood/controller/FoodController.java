package com.edu.safefood.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.safefood.dto.Blog;
import com.edu.safefood.dto.Criteria;
import com.edu.safefood.dto.Member;
import com.edu.safefood.dto.NaverSearchObject;
import com.edu.safefood.dto.PageMaker;
import com.edu.safefood.service.FoodService;
import com.edu.safefood.service.MemberService;
import com.edu.safefood.util.BlogSearch;
import com.edu.safefood.util.NaverSearch;

@Controller
@RequestMapping("food")
public class FoodController {

	@Autowired
	FoodService ser;

	@Autowired
	MemberService mser;

	// 정렬 종류 설정하는 함수 (name == 1, calorie == 2)
	private int setSortType(String sortType) {
		if (sortType == null) {
			return 0;
		} else if (sortType.equals("1")) {
			return 1;
		} else if (sortType.equals("2")) {
			return 2;
		}
		return -1;
	}

	// 검색 조건 설정하는 함수. (name == 1, maker == 2, material == 3, none == 4)
	private int setSearchCondition(String searchCondition) {
		if (searchCondition.equals("name")) {
			return 1;
		} else if (searchCondition.equals("maker")) {
			return 2;
		} else if (searchCondition.equals("material")) {
			return 3;
		}
		return 0;
	}

	@RequestMapping("/detail")
	public ModelAndView detailFood(ModelAndView model, HttpServletRequest req) {
		try {
			HttpSession session = req.getSession();
			String id = (String) session.getAttribute("id");
			String code = req.getParameter("code");
			Set<String> s = new TreeSet<String>();
			Set<String> s2 = new TreeSet<String>();
			if (id != null) {
				StringBuilder sb = new StringBuilder();
				StringBuilder sb2 = new StringBuilder();
				Member m = mser.searchById(id);
				List<String> temp = m.getAllergy();
				if (temp.size() != 0) {
					String mat = ser.getFood(Integer.parseInt(code)).getMaterial();
					for (String aller : temp) {
						if (mat.contains(aller)) {
							s.add(aller);
							s2.add(aller);
						}
					}
					String mat2 = ser.getFood(Integer.parseInt(code)).getAllergy();
					for (String aller : temp) {
						if (mat2.contains(aller)) {
							s.add(aller);
							s2.add(aller);
						}
					}
				}
				for (String ss : s) {
					sb.append(ss + " ");
				}
				for (String ss : s2) {
					sb2.append(ss + " ");
				}
				req.setAttribute("allergy", sb.toString());
				req.setAttribute("myAllergy", sb2.toString());
			}
			req.setAttribute("food", ser.getFood(Integer.parseInt(code)));
			model.setViewName("detail");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return model;
	}

	private ModelAndView makeList(HttpServletRequest req, ModelAndView model, Criteria cri, HttpSession ss,
			String viewName) {
		try {
			String searchCondition = req.getParameter("searchCondition");
			String searchWord = req.getParameter("searchWord");
			String sortType = req.getParameter("sortType");
			String id = (String) ss.getAttribute("id");
			List<String> aller = mser.searchById(id).getAllergy();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			model.addObject("pageMaker", pageMaker);

			int sort = setSortType(sortType);
			if (searchCondition == null || searchCondition.equals("") || searchWord == null || searchWord.equals("")) {
				req.setAttribute("list", ser.getList(cri, aller));
				pageMaker.setTotalCnt(ser.totalCount());
			} else {
				int type = setSearchCondition(searchCondition);
				req.setAttribute("list", ser.search(type, searchWord, sort, cri, aller));
				model.addObject("searchCondition", searchCondition);
				model.addObject("searchWord", searchWord);
				model.addObject("sortType", sortType);
				pageMaker.setTotalCnt(ser.searchTotalCount(type, searchWord));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.setViewName(viewName);
		return model;
	}

	@RequestMapping("/list")
	private ModelAndView listFood(HttpServletRequest req, ModelAndView model, Criteria cri, HttpSession ss) {
		return makeList(req, model, cri, ss, "foodInfo");
	}

	@RequestMapping("/imgList")
	private ModelAndView imgListFood(HttpServletRequest req, ModelAndView model, Criteria cri, HttpSession ss) {
		return makeList(req, model, cri, ss, "foodImgInfo");
	}

	@RequestMapping("/searchNaver")
	public String getSearchNaverPage() {
		return "searchNaver";
	}

	@RequestMapping("/searchBlog")
	public String getSearchBlogPage() {
		return "searchBlog";
	}

	@RequestMapping(value = "/naver/{query}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getSearchFromNaver(@PathVariable("query") String query) {
		HashMap<String, Object> entity = new HashMap<>();
		NaverSearch ns = new NaverSearch();
		try {
			List<NaverSearchObject> list = ns.search(query);
			entity.put("list", list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return entity;
	}

	@RequestMapping(value = "/blog/{query}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getSearchFromBlog(@PathVariable("query") String query) {
		HashMap<String, Object> entity = new HashMap<>();
		BlogSearch bs = new BlogSearch();
		try {
			List<Blog> list = bs.search(query);
			entity.put("list", list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return entity;
	}
}
