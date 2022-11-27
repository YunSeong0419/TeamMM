package com.mealmaker.babiyo.review.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mealmaker.babiyo.review.service.ReviewService;


@Controller
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/review/collection.do", method = RequestMethod.GET)
	public String reviewCollection(Model model) {
		logger.info("ReviewController collection! ");
		
		return "review/collection";
	}

	//오븐 18p 헤더-리뷰-리뷰 상세
	@RequestMapping(value = "/review/detail.do")
	public String reviewDetail(Model model) {
		logger.info("ReviewController reviewDetail! ");
		
//		List<Map<String, Object>> reviewDetail = reviewService.reviewDetail();
//		
//		model.addAttribute("reviewDetail", reviewDetail);
//			
		return "review/detail";
	}
}

