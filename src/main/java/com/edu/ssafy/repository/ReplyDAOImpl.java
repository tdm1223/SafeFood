package com.edu.ssafy.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.ssafy.dto.Reply;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public void addReply(Reply reply) {
		session.insert("reply.insert",reply);
	}

	@Override
	public void delReply(int rno) {
		session.delete("reply.delete",rno);
	}

	@Override
	public void updateReply(Reply reply) {
		session.update("reply.update",reply);
	}

	@Override
	public List<Reply> getList(int qno) {		
		return session.selectList("reply.selectList", qno);
	}

}
