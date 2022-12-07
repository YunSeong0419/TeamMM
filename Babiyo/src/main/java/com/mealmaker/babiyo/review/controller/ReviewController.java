package com.mealmaker.babiyo.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.product.dao.ProductDao;
import com.mealmaker.babiyo.product.service.ProductService;
import com.mealmaker.babiyo.review.model.ReviewDto;
import com.mealmaker.babiyo.review.service.ReviewService;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;


@Controller
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@Resource
	private ProductService productService;
	
	//헤더-리뷰 모음
	@RequestMapping(value = "/review/collection.do", method = RequestMethod.GET)
	public String reviewCollection(Model model) {
		logger.info("ReviewController collection!");
		
		List<Map<String, Object>> reviewCollectionList = reviewService.reviewCollectionList();
		
		model.addAttribute("reviewCollectionList", reviewCollectionList);
		
		return "review/collection";
	}
	
	//헤더-리뷰 모음-리뷰 상세(회원)
	@RequestMapping(value = "/review/detail.do")
	public String reviewDetail(int no, HttpSession session, Model model) {
		logger.info("ReviewController reviewDetail! - {}", no);

		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		String memberId = memberDto.getId();
		
		List<Map<String, Object>> reviewDetail = reviewService.detail(memberId, no);

		model.addAttribute("reviewDetail", reviewDetail);
			
		return "review/detail";
	}
		
	//관리자-리뷰 관리(목록)
	@RequestMapping(value = "/review/adminList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String reviewList(@RequestParam(defaultValue = "1") int curPage
			, SearchOption searchOption, Model model) {
		logger.info("ReviewController reviewList! curPage: {}, searchOption: {}"
				, curPage, searchOption);
	
		int totalCount = productService.productCount(searchOption);
		
		Paging paging = new Paging(totalCount, curPage);
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<Map<String, Object>> reviewList = reviewService.productReviewList(searchOption, begin, end);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("paging", paging);
		
		return "admin/review/adminReviewList";
	}
	
	//회원-밀키트 상세-리뷰 등록 페이지로 이동
	@RequestMapping(value = "/review/write.do", method = RequestMethod.GET)
	public String writeReview(Model model) {
		logger.info("ReviewController writeReview!");
		
		return "review/write";
	}

	//회원-밀키트 상세-리뷰 등록(등록 후 리뷰 쓰기 버튼이 있던 회원-밀키트 상세로 돌아감.)
	@RequestMapping(value = "/review/writeCtr.do", method = RequestMethod.POST)
	public String reviewRegistration(ReviewDto reviewDto, 
		MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		logger.info("ReviewController reviewRegistration 리뷰 등록 완료!" + reviewDto);
		
		try {
			reviewService.reviewRegistration(reviewDto, multipartHttpServletRequest);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/product/memberDetail.do";
	}
	

	//회원-내 정보-내가 쓴 리뷰로 가기
	@RequestMapping(value = "/review/myReview.do", method = RequestMethod.GET)
	public String myReview(Model model) {
		logger.info("ReviewController myReview!");
		
		return "review/myReview";
	}
	
	//관리자-리뷰 관리-상세
	@RequestMapping(value = "/review/adminDetail.do", method = RequestMethod.GET)
	public String adminReviewDetail(Model model) {
		logger.info("ReviewController collection! ");
		
		return "admin/review/adminReviewDetail";
	}	
	
	//오븐 39p 회원-리뷰 상세-리뷰 수정 페이지로 이동
//	@RequestMapping(value = "/review/modification.do", method = RequestMethod.GET)
//	public String reviewModification(int no, Model model) {
//		logger.debug("ReviewController reviewModification!" + no);
//		
//		Map<String, Object> map = reviewService.detail(no);
//		
//		ReviewDto reviewDto = (ReviewDto).get("reviewDto");
//
//		List<Map<String, Object>> fileList 
//			= (List<Map<String, Object>>) map.get("fileList");
//		
//		model.addAttribute("reviewDto", reviewDto);
//		model.addAttribute("fileList", fileList);
//		
//		return "review/modification";
//	}
	
	//회원-리뷰 상세-리뷰 수정
	@RequestMapping(value = "/review/modificationCtr.do", method = RequestMethod.POST)
	public String reviewModificationCtr(HttpSession session, ReviewDto reviewDto
		, @RequestParam(value = "fileIdx", defaultValue = "-1") int fileIdx
		, MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		logger.info("ReviewController reviewModificationCtr {} :: {}" , reviewDto, fileIdx);
		
		int resultNum = 0; 
			
		try {
			resultNum = reviewService.reviewModification(reviewDto, multipartHttpServletRequest, fileIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//DB에서 리뷰가 수정됐는지 증명 
		ReviewDto sessionReviewDto = (ReviewDto)session.getAttribute("_reviewDto_");
		
		if(sessionReviewDto != null) {
			if(sessionReviewDto.getNo() == reviewDto.getNo()) {
				ReviewDto proofModificationDto = new ReviewDto();
				
				proofModificationDto.setNo(reviewDto.getNo());
				proofModificationDto.setProductNo(reviewDto.getProductNo());
				proofModificationDto.setMemberId(reviewDto.getMemberId());
				proofModificationDto.setStarRating(reviewDto.getStarRating());
				proofModificationDto.setContent(reviewDto.getContent());
				proofModificationDto.setCreateDate(reviewDto.getCreateDate());
				proofModificationDto.setModifyDate(reviewDto.getModifyDate());

				session.removeAttribute("_reviewDto_");
				session.setAttribute("_reviewDto_", proofModificationDto);
			}
		}
		return "review/modificationSuccess";
	}
	
	//회원-리뷰 상세-리뷰 삭제
	@RequestMapping(value = "/review/deleteCtr.do", method = RequestMethod.GET)
	public String reviewDelete(int no, String backPage, Model model) {
		logger.info("ReviewController reviewDelete! " + no);
		
		reviewService.reviewDelete(no);
		
		String url = "";
		
		if(backPage.equals("memberReviewList")) {
			url = "redirect:/review/memberReviewList.do";
		} else {
			url = "redirect:/review/collection.do";
		}
		
		return url;
	}
}