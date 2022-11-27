package com.mealmaker.babiyo.review.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.review.model.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.review.";
	
	//DB에 있는 리뷰 상세 퍼오기
	@Override
	public List<ReviewDto> reviewDetail() {
		
		return sqlSession.selectList(namespace + "reviewDetail");
	}
	
	//파일 삽입
	@Override
	public void insertFile(Map<String, Object> map) {
	
		sqlSession.insert(namespace + "insertFile", map);
	}

	//파일 묶음 불러오기
	@Override
	public List<Map<String, Object>> fileSelectList(int productNo) {
		
		return sqlSession.selectList(namespace + "fileSelectList", productNo);
	}

	//파일 저장된 이름 불러오기??
	@Override
	public Map<String, Object> fileSelectStoredFileName(int parentSeq) {

		return sqlSession.selectOne(namespace + "fileSelectStoredFileName", parentSeq);
	}

	//파일 삭제
	@Override
	public int fileDelete(int parentSeq) {
		
		return sqlSession.delete(namespace + "fileDelete", parentSeq);
	}
}
