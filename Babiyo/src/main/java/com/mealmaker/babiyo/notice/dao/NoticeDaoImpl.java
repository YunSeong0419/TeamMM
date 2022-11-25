package com.mealmaker.babiyo.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.notice.model.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.notice.";
	//관리자
	@Override
	public List<NoticeDto> noticeSelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "noticeList");
	}
	
	
	@Override
	public NoticeDto noticeSelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"noticeSelectOne", no);
	}
	
	
	
	
	@Override
	public void noticeDeleteOne(int no) {
		// TODO Auto-generated method stub
		 sqlSession.delete(namespace + "noticeDeleteOne", no);
	}

}
