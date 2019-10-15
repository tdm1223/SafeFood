package com.edu.safefood.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.safefood.dto.Allergy;
import com.edu.safefood.dto.Blog;
import com.edu.safefood.dto.Criteria;
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
	public ModelAndView detailFood(ModelAndView model, HttpServletRequest req, HttpSession session) {
		try {
			String id = (String) session.getAttribute("id");
			String code = req.getParameter("code");

			StringBuilder foodIngredients = new StringBuilder(); // 선택한 음식의 성분+알러지를 저장할 String
			foodIngredients.append(ser.getFood(Integer.parseInt(code)).getMaterial())
					.append(ser.getFood(Integer.parseInt(code)).getAllergy());

			StringBuilder allergy = new StringBuilder(); // 선택한 음식이 가지고 있는 알러지
			List<Allergy> allAllergy = mser.getAllergyListAll(); // 알러지 후보군을 가져옴
			// 알러지 후보군과 선택한 음식의 성분+알러지값을 비교해서 실제 알러지를 구함
			for (Allergy a : allAllergy) {
				if (foodIngredients.toString().contains(a.getName())) {
					allergy.append(a.getName() + " ");
				}
			}

			// 사용자의 알러지를 구함
			if (id != null) {
				StringBuilder myAllergy = new StringBuilder(); // 사용자의 알러지를 저장할 String
				List<String> memberAllergy = mser.searchById(id).getAllergy(); // id로 사용자의 알러지 가져온다.
				// 사용자가 가지고 있는 알러지와 음식이 가지고 있는 알러지를 비교
				if (memberAllergy.size() > 0) {
					for (String aller : memberAllergy) {
						if (foodIngredients.toString().contains(aller)) {
							myAllergy.append(aller + " ");
						}
					}
				}
				req.setAttribute("myAllergy", myAllergy.toString());
			}

			req.setAttribute("allergy", allergy.toString());
			req.setAttribute("food", ser.getFood(Integer.parseInt(code)));
			model.setViewName("detail");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return model;
	}

	// 음식 리스트를 보여주는 페이지를 만드는 setViewName인자에 viewName을 넣음
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
