package com.edu.ssafy.service;

import java.util.List;

import com.edu.ssafy.dto.Reply;

public interface ReplyService {
	// Reply 등록
	public void addReply(Reply reply);

	// Reply 삭제
	public void delReply(int rno);

	// Reply 수정
	public void updateReply(Reply reply);

	// Reply 목록
	public List<Reply> getList(int qno);
}
