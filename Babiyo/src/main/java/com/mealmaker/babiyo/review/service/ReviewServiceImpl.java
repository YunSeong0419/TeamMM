package com.mealmaker.babiyo.review.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.product.dao.ProductDao;
import com.mealmaker.babiyo.review.dao.ReviewDao;
import com.mealmaker.babiyo.review.model.ReviewDto;
import com.mealmaker.babiyo.util.FileUtils;
import com.mealmaker.babiyo.util.SearchOption;

@Service
public class ReviewServiceImpl implements ReviewService{

	//log4j 사용
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	//이미지 첨삭용 보조프로그램
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	public ReviewDao reviewDao;
	
	@Resource
	private ProductDao productDao;

	//DAO에서 리뷰 목록 꺼내오게 시키기
	@Override
	public List<Map<String, Object>> reviewList() {
		List<Map<String, Object>> resultList = new ArrayList<>();
		
		List<ReviewDto> reviewList = reviewDao.reviewList();
		
		for (ReviewDto reviewDto : reviewList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int productNo = reviewDto.getProductNo();
			int reviewQuantity = reviewDao.reviewQuantity(productNo);
			
			map.put("reviewDto", reviewDto);
			map.put("reviewQuantity", reviewQuantity);
			
			resultList.add(map);
		}
		
		return resultList;
	}
	
	//DAO에서 리뷰 정보 꺼내오게 시키기(밀키트 상세에 사용)
	@Override
	public Map<String, Object> productReviewInfo(int productNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int reviewQuantity = reviewDao.reviewQuantity(productNo);
		double reviewEvaluation = reviewDao.reviewEvaluation(productNo);
		
		map.put("reviewQuantity", reviewQuantity);
		map.put("reviewEvaluation", reviewEvaluation);
		
		return map;
	}
	
	//DAO에서 리뷰 상세 꺼내오게 시키기
	@Override
	public List<Map<String, Object>> detail(String memberId, int no) {
		List<ReviewDto> reviewDetail = reviewDao.reviewDetail();
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for (ReviewDto reviewDto : reviewDetail) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int reviewNo = reviewDto.getNo();
			List<Map<String, Object>> imgMap = reviewDao.fileSelectList(reviewNo);
			
			map.put("reviewDto", reviewDto);
			map.put("imgMap", imgMap);
			
			list.add(map);
		}
		
		return list;
	}


	@Override
	public void reviewRegistration(ReviewDto reviewDto, MultipartHttpServletRequest mulRequest)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> reviewAdminDetail(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int reviewModification(ReviewDto reviewDto, MultipartHttpServletRequest mulRequest)
		throws Exception {
		
		return 0;
	}

	@Override
	public void reviewDelete(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Map<String, Object>> productReviewList(SearchOption searchOption, int begin, int end) {
		
		return reviewDao.productReviewList(searchOption, begin, end);
	}
	
	@Override
	public List<Map<String, Object>> reviewCollectionList() {
		// TODO Auto-generated method stub
		return null;
	}

}
