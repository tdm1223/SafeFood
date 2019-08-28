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

	@RequestMapping("/info")
	public ModelAndView info(ModelAndView m, HttpServletRequest req, Criteria cri, HttpSession ss) {
		String searchCondition = req.getParameter("searchCondition");
		String searchWord = req.getParameter("searchWord");
		String sortType = req.getParameter("sortType");

		String id = (String) ss.getAttribute("id");
		List<String> aller = mser.searchById(id).getAllergy();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int sort = 0;
		if (sortType == null) {
			sort = 0;
		} else if (sortType.equals("1")) {
			sort = 1;
		} else if (sortType.equals("2")) {
			sort = 2;
		}
		if (searchCondition == null || searchCondition.equals("") || searchWord == null || searchWord.equals("")) {
			if (sort == 0) {
				req.setAttribute("list", ser.getList(cri, aller));
				m.setViewName("foodInfo");
				pageMaker.setTotalCnt(ser.totalCount());
			} else {
				req.setAttribute("list", ser.search(0, searchWord, sort, cri, aller));
				m.setViewName("foodInfo");
				pageMaker.setTotalCnt(ser.totalCount());
			}
		} else {
			int type = 0;
			if (searchCondition.equals("name")) {
				type = 1;
			} else if (searchCondition.equals("maker")) {
				type = 2;
			} else if (searchCondition.equals("material")) {
				type = 3;
			}

			req.setAttribute("list", ser.search(type, searchWord, sort, cri, aller));
			m.setViewName("foodInfo");
			m.addObject("searchCondition", searchCondition);
			m.addObject("searchWord", searchWord);

			pageMaker.setTotalCnt(ser.searchTotalCount(type, searchWord));

		}
		m.addObject("pageMaker", pageMaker);
		return m;
	}

	@RequestMapping("/imgInfo")
	public ModelAndView imgInfo(ModelAndView m, HttpServletRequest req, Criteria cri, HttpSession ss) {
		String searchCondition = req.getParameter("searchCondition");
		String searchWord = req.getParameter("searchWord");
		String sortType = req.getParameter("sortType");
		String id = (String) ss.getAttribute("id");
		List<String> aller = mser.searchById(id).getAllergy();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		int sort = 0;
		if (sortType == null) {
			sort = 0;
		} else if (sortType.equals("1")) {
			sort = 1;
		} else if (sortType.equals("2")) {
			sort = 2;
		}
		if (searchCondition == null || searchCondition.equals("") || searchWord == null || searchWord.equals("")) {
			if (sort == 0) {
				req.setAttribute("list", ser.getList(cri, aller));
				m.setViewName("foodInfo2");
			} else {
				req.setAttribute("list", ser.search(0, searchWord, sort, cri, aller));
				m.setViewName("foodInfo2");
			}
		} else {
			int type = 0;
			if (searchCondition.equals("name")) {
				type = 1;
			} else if (searchCondition.equals("maker")) {
				type = 2;
			} else if (searchCondition.equals("material")) {
				type = 3;
			}

			req.setAttribute("list", ser.search(type, searchWord, sort, cri, aller));
			m.setViewName("foodInfo2");
			m.addObject("searchCondition", searchCondition);
			m.addObject("searchWord", searchWord);

			pageMaker.setTotalCnt(ser.searchTotalCount(type, searchWord));
		}
		m.addObject("pageMaker", pageMaker);
		return m;
	}

	@RequestMapping("/detail")
	public ModelAndView detailFood(ModelAndView model, HttpServletRequest req) {
		try {
			HttpSession session = req.getSession();
			String id = (String) session.getAttribute("id");
			String code = req.getParameter("code");
			Set<String> s = new TreeSet<String>();
			Set<String> s2 = new TreeSet<String>();
			if (id == null) {

			} else {
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

	@RequestMapping("/list")
	private ModelAndView listFood(HttpServletRequest req, ModelAndView model, Criteria cri, HttpSession ss) {
		try {
			String searchCondition = req.getParameter("searchCondition");
			String searchWord = req.getParameter("searchWord");
			String sortType = req.getParameter("sortType");
			String id = (String) ss.getAttribute("id");
			List<String> aller = mser.searchById(id).getAllergy();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			int sort = 0;
			if (sortType == null) {
				sort = 0;
			} else if (sortType.equals("1")) {
				sort = 1;
			} else if (sortType.equals("2")) {
				sort = 2;
			}

			if (searchCondition == null || searchCondition.equals("") || searchWord == null || searchWord.equals("")) {
				req.setAttribute("list", ser.getList(cri, aller));
				pageMaker.setTotalCnt(ser.totalCount());
				model.addObject("pageMaker", pageMaker);

			} else {
				int type = 0;
				if (searchCondition.equals("name")) {
					type = 1;
				} else if (searchCondition.equals("maker")) {
					type = 2;
				} else if (searchCondition.equals("material")) {
					type = 3;
				}

				req.setAttribute("list", ser.search(type, searchWord, sort, cri, aller));
				model.addObject("searchCondition", searchCondition);
				model.addObject("searchWord", searchWord);
				model.addObject("sortType", sortType);

				pageMaker.setTotalCnt(ser.searchTotalCount(type, searchWord));
				model.addObject("pageMaker", pageMaker);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.setViewName("foodInfo");
		return model;
	}

	@RequestMapping("/imgList")
	private ModelAndView imgListFood(HttpServletRequest req, ModelAndView model, Criteria cri, HttpSession ss) {
		try {

			String searchCondition = req.getParameter("searchCondition");
			String searchWord = req.getParameter("searchWord");
			String sortType = req.getParameter("sortType");
			String id = (String) ss.getAttribute("id");
			List<String> aller = mser.searchById(id).getAllergy();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			int sort = 0;
			if (sortType == null) {
				sort = 0;
			} else if (sortType.equals("1")) {
				sort = 1;
			} else if (sortType.equals("2")) {
				sort = 2;
			}

			if (searchCondition == null || searchCondition.equals("") || searchWord == null || searchWord.equals("")) {
				req.setAttribute("list", ser.getList(cri, aller));

				pageMaker.setTotalCnt(ser.totalCount());
				model.addObject("pageMaker", pageMaker);
			} else {
				int type = 0;
				if (searchCondition.equals("name")) {
					type = 1;
				} else if (searchCondition.equals("maker")) {
					type = 2;
				} else if (searchCondition.equals("material")) {
					type = 3;
				}

				req.setAttribute("list", ser.search(type, searchWord, sort, cri, aller));
				model.addObject("searchCondition", searchCondition);
				model.addObject("searchWord", searchWord);
				model.addObject("sortType", sortType);

				pageMaker.setTotalCnt(ser.searchTotalCount(type, searchWord));
				model.addObject("pageMaker", pageMaker);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.setViewName("foodInfo2");
		return model;
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
