package com.edu.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.safefood.dto.Reply;
import com.edu.safefood.repository.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	@Override
	public void addReply(Reply reply) {
		dao.addReply(reply);
	}

	@Override
	public void delReply(int rno) {
		dao.delReply(rno);
	}

	@Override
	public void updateReply(Reply reply) {
		dao.updateReply(reply);
	}

	@Override
	public List<Reply> getList(int qno) {
		return dao.getList(qno);
	}

}
