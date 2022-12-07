package com.mealmaker.babiyo.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.review.model.ReviewDto;
import com.mealmaker.babiyo.util.SearchOption;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.review.";
	
	//DB에서 리뷰 목록 퍼오기
	@Override
	public List<ReviewDto> reviewList() {
		
		return sqlSession.selectList(namespace + "reviewList");
	}
	
	//DB에서 리뷰 목록-리뷰 수 퍼오기
	@Override
	public int reviewQuantity(int productNo) {
		
		return sqlSession.selectOne(namespace + "reviewQuantity", productNo);
	}
	
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

	@Override
	public List<Map<String, Object>> productReviewList(SearchOption searchOption, int begin, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("begin", begin);
		paraMap.put("end", end);
		paraMap.put("searchOption", searchOption.getSearchOption());
		paraMap.put("search", searchOption.getSearch());
		paraMap.put("sort", searchOption.getSort());
		
		return sqlSession.selectList(namespace + "productReviewList", paraMap);
		
	}
}
