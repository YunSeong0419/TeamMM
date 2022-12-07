package com.mealmaker.babiyo.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.review.model.ReviewDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface ReviewService {
	
	//리뷰 모음에 리스트 쏴주기
	List<Map<String, Object>> reviewCollectionList();
	//목록
	List<Map<String, Object>> reviewList();
	//등록
	public void reviewRegistration(ReviewDto reviewDto
		, MultipartHttpServletRequest mulRequest) throws Exception;
	//관리자 상세
	Map<String, Object> reviewAdminDetail(int no);
	//회원 상세
	List<Map<String, Object>> detail(String memberId, int no);
	//수정	
	public int reviewModification(ReviewDto reviewDto
		, MultipartHttpServletRequest mulRequest) throws Exception;
	//삭제
	public void reviewDelete(int no);
	//???
	public Map<String, Object> productReviewInfo(int productNo);
	List<Map<String, Object>> productReviewList(SearchOption searchOption, int begin, int end);
}
