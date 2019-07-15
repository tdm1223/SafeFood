package com.edu.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.edu.ssafy.dto.Reply;
import com.edu.ssafy.service.MemberService;
import com.edu.ssafy.service.QnAService;
import com.edu.ssafy.service.ReplyService;

@RestController
@RequestMapping("reply")
public class ReplyController {

	@Autowired
	ReplyService replySer;

	@Autowired
	MemberService memberSer;

	@Autowired
	QnAService qnaSer;

	@RequestMapping(value = "/list/{qno}", method = RequestMethod.GET)
	public ResponseEntity<List<Reply>> getReplyList(@PathVariable("qno") String qno) throws Exception {

		ResponseEntity<List<Reply>> entity = null;

		try {
			List<Reply> rlist = replySer.getList(Integer.parseInt(qno));
			entity = new ResponseEntity<List<Reply>>(rlist, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<List<Reply>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/addReply", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addReply(@RequestBody Map<String, Object> params) throws Exception {

		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Reply reply = new Reply();
			reply.setId((String) params.get("id"));
			reply.setText((String) params.get("text"));
			reply.setQno(Integer.parseInt((String) params.get("qno")));

			replySer.addReply(reply);

			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("qno", reply.getQno());

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/update", method = RequestMethod.PUT)
	public ResponseEntity<Map<String, Object>> updateReply(@RequestBody Reply reply) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			replySer.updateReply(reply);
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> deleteReply(@RequestBody Map<String, String> params) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			replySer.delReply(Integer.parseInt(params.get("rno")));
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
