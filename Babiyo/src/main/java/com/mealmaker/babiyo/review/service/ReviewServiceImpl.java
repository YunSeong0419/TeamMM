package com.mealmaker.babiyo.review.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.review.dao.ReviewDao;
import com.mealmaker.babiyo.review.model.ReviewDto;
import com.mealmaker.babiyo.util.FileUtils;

@Service
public class ReviewServiceImpl implements ReviewService{

	//log4j 사용
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	//이미지 첨삭용 보조프로그램
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	public ReviewDao reviewDao;

	//DAO에서 리뷰 상세 꺼내오게 시키기
	@Override
	public List<Map<String, Object>> reviewDetail() {
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
}
