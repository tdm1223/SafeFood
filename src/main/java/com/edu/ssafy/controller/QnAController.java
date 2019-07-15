package com.edu.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.ssafy.dto.Criteria;
import com.edu.ssafy.dto.PageMaker;
import com.edu.ssafy.dto.QnA;
import com.edu.ssafy.service.QnAService;

@Controller
@RequestMapping("qna")
public class QnAController {

	@Autowired
	QnAService service;

	@RequestMapping("/list")
	public ModelAndView getQnAPage(ModelAndView model, Criteria cri) {
		List<QnA> qlist = service.getList(cri);
		model.addObject("qlist", qlist);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCnt(service.totalCount());
		model.addObject("pageMaker", pageMaker);

		model.setViewName("qnaBoard");

		return model;
	}

	@RequestMapping(value = "/add")
	public String getAddForm() {
		return "qnaAdd";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String boardAdd(@RequestParam String title, @RequestParam String id, @RequestParam String content,
			@RequestParam int qcode) throws Exception {

		try {
			service.addQnA(title, id, content, qcode);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:list";
	}

	// QnA 목록 반환
	@RequestMapping(value = "/getList/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getQnAList(Criteria cri) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("qlist", result);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCnt(service.totalCount());
			result.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(ModelAndView model, HttpServletRequest req) {
		int qno = Integer.parseInt(req.getParameter("qno"));
		service.delQnA(qno);
		model.setViewName("redirect:list");
		return model;
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam("qno") int qno, ModelAndView m) throws Exception {
		m.addObject("qna", service.getQnA(qno));
		m.setViewName("qnaUpdate");
		return m;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam String title, @RequestParam String content, @RequestParam int qno)
			throws Exception {
		service.updateQnA(title, content, qno);

		return "redirect:list";
	}

	@RequestMapping(value = "/detail")
	public ModelAndView viewForm(@RequestParam(value = "qno", required = false) String qno, ModelAndView model,
			HttpSession session) throws Exception {

		if (qno == null) {
			qno = (String) session.getAttribute("qno");
		} else {
			session.setAttribute("qno", qno);
		}

		QnA result = service.getQnA(Integer.parseInt(qno));

		model.addObject("qna", result);
		model.setViewName("qnaDetail");

		return model;
	}
}
