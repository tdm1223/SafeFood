package com.edu.safefood.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.edu.safefood.dto.Criteria;
import com.edu.safefood.dto.QnA;

@Repository
public class QnADAOImpl implements QnADAO {

	@Autowired
	SqlSession session;
	
	@Override
	public List<QnA> getList(Criteria cri) {
		try {
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("startPage", cri.getStartPage());
			param.put("endPage",cri.getEndPage());
			return session.selectList("qna.selectList",param);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void addQnA(String title, String id, String content,int qcode) {
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("qcode",qcode);
			map.put("title", title);
			map.put("id", id);
			map.put("content",content);
			session.insert("qna.insert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void delQnA(int qno) {
		try {
			session.delete("qna.delete", qno);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateQnA(String title, String content, int qno) {
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("title", title);
			map.put("content",content);
			map.put("qno", qno);
			session.update("qna.update", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public QnA getQnA(int qno) {
		try {
			return session.selectOne("qna.selectOne",qno);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int totalCount() {
		try {
			return session.selectOne("qna.selectCount");
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

}
