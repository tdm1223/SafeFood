package com.edu.safefood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.safefood.dto.Criteria;
import com.edu.safefood.dto.QnA;
import com.edu.safefood.repository.QnADAO;

@Service
public class QnaServiceImpl implements QnAService {

	@Autowired
	private QnADAO dao;
	
	@Override
	public List<QnA> getList(Criteria cri) {
		return dao.getList(cri);
	}

	@Override
	public void addQnA(String title, String id, String content,int qcode) {
		dao.addQnA(title,id,content,qcode);
	}

	@Override
	public void delQnA(int qno) {
		dao.delQnA(qno);
	}

	@Override
	public void updateQnA(String title, String content, int qno) {
		dao.updateQnA(title,content,qno);
	}

	@Override
	public QnA getQnA(int qno) {
		return dao.getQnA(qno);
	}

	@Override
	public int totalCount() {
		return dao.totalCount();
	}

}
