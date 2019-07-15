package com.edu.ssafy.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.ssafy.dto.Member;
import com.edu.ssafy.service.MemberService;

@Controller
public class HomeController {

	@Autowired
	MemberService memService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "login";
	}

	@RequestMapping("/index")
	public ModelAndView index(ModelAndView m, HttpSession session)
	{
		String id = (String)session.getAttribute("id");
		String range = "3 month";
		
		if(session.getAttribute("update") != null) {
			boolean isUpdate = (Boolean)session.getAttribute("update");
			
			if(isUpdate) {
				memService.getMyData(m, id, range);
				session.setAttribute("update", false);
			}else {
				memService.findMyDataCache(m, id);
			}
		}else {		
			System.out.println("DAO접근");
			session.setAttribute("update", false);
			memService.getMyData(m, id, range);
		}
				
		m.addObject("list", memService.getCurCache(id));
		return m;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(ModelAndView model, HttpSession session, @RequestParam("id") String id,
			@RequestParam("pwd") String pwd) {

		if (memService.logIn(id, pwd) != null) {
			session.setAttribute("id", id);
			session.setAttribute("update", true);
			memService.getCache().put(id, memService.getCache(id));
			model.setViewName("redirect:/index");
		} else {
			model.addObject("msg", "아이디 또는 패스워드가 다릅니다");
			model.setViewName("error");
		}

		return model;
	}

	@RequestMapping("/logout")
	private String logout(HttpSession session) {
		memService.saveCache((String) session.getAttribute("id"));
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/signUp")
	public ModelAndView signUp(ModelAndView model) {
		model.addObject("allergins", memService.getAllergyListAll());
		model.setViewName("signUp");

		return model;
	}

	@RequestMapping("/save")
	public ModelAndView save(ModelAndView model, @RequestParam("id") String id, @RequestParam("pwd") String pwd,
			@RequestParam("name") String name, @RequestParam("addr") String addr, @RequestParam("name") String phone,
			HttpServletRequest request, HttpServletResponse response) {

		List<String> allergy = Arrays.asList(request.getParameterValues("allergy"));
		if (allergy.size() == 0) {
		}

		if (memService.searchById(id) == null) {
			if (memService.add(new Member(id, pwd, name, addr, phone, allergy))) {
				Cookie c = new Cookie("id", id);
				response.addCookie(c);
				model.addObject("msg", "가입을 환영합니다.");
				model.setViewName("login");
			} else {
				model.addObject("msg", "저장오류");
				model.setViewName("error");
			}
		} else {
			model.addObject("msg", "이미 등록된 아이디입니다.");
			model.setViewName("error");
		}

		return model;
	}
}
