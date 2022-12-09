package com.mealmaker.babiyo.review.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.review.model.ReviewDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface ReviewDao {
	//목록
	public List<ReviewDto> reviewList();
	//목록-리뷰 수
	public int reviewQuantity(int productNo);
	//목록-리뷰 평점
	public double reviewEvaluation(int productNo);
	//상세
	public List<ReviewDto> reviewDetail();
	//이미지 첨삭
	public void insertFile(Map<String, Object> map);
	
	public List<Map<String, Object>> fileSelectList(int no);
	
	public String fileSelectStoredFileName(int parentSeq);
	
	public int fileDelete(int parentSeq);
	
	public List<Map<String, Object>> productReviewList(SearchOption searchOption, int begin, int end);
	
	//내정보 리뷰 카운트
	public int memberReviewCount(String id);
	
	public List<Map<String, Object>> buyProductList(String memberId);
	
	public void reviewWrite(ReviewDto reviewDto);
	
	public List<ReviewDto> reviewCollectionList();
}

