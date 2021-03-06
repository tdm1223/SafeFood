package com.edu.safefood.service;

import java.util.List;

import com.edu.safefood.dto.Criteria;
import com.edu.safefood.dto.QnA;

public interface QnAService {
	// qna 목록
	public List<QnA> getList(Criteria cri);

	// qna 등록
	public void addQnA(String title, String id, String content,int qcode);

	// qna 삭제
	public void delQnA(int qno);

	// qna 수정
	public void updateQnA(String title, String content, int qno);

	// qna 상세 정보
	public QnA getQnA(int qno);
	
	// qna 개수 반환
	public int totalCount();
}
