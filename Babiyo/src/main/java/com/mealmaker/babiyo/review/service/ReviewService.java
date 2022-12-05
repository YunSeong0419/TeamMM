package com.mealmaker.babiyo.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.review.model.ReviewDto;

public interface ReviewService {

	//목록
	List<Map<String, Object>> reviewList();
	//등록
	public void reviewRegistration(ReviewDto reviewDto
		, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;
	//관리자 상세
	Map<String, Object> reviewAdminDetail(int no);
	//상세
	List<Map<String, Object>> detail();
	//수정	
	public int reviewModification(ReviewDto reviewDto
		, MultipartHttpServletRequest multipartHttpServletRequest
		, int fileIdx) throws Exception;
	//삭제
	public void reviewDelete(int no);
	//???
	public int reviewTotalCount(String searchOption, String sortOption, String keyword);
	public int reviewQuantity(int productNo);
}
