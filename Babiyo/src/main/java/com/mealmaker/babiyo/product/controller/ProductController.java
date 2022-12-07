package com.mealmaker.babiyo.product.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.product.service.ProductService;
import com.mealmaker.babiyo.review.service.ReviewService;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

@Controller
public class ProductController {

	private static final Logger logger 
		= LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ReviewService reviewService;
	
	//헤더-밀키트 카테고리
	@RequestMapping(value = "/product/category.do", method = RequestMethod.GET)
	public String productCategory(@RequestParam(defaultValue = "1") int curPage
			,SearchOption searchOption, Model model) {
		logger.info("ProductController category! curPage: {}, searchOption: {}", curPage, searchOption);
		
		//카테고리 목록을 불러옴
		List<Map<String, Object>> productCategory = productService.productCategory();
		
		int categoryCount = productService.categoryCount(searchOption);	
		
		Paging paging = new Paging(categoryCount, curPage, 8, 10);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		//선택된 카테고리의 상품을 불러옴
		List<Map<String, Object>> categoryList = productService.categoryList(searchOption, begin, end);
		
		model.addAttribute("paging", paging);
		model.addAttribute("productCategory", productCategory);
		model.addAttribute("categoryList", categoryList);
		
		return "product/category";
	}
	
	//헤더-밀키트 카테고리-밀키트 상세(회원)
	@RequestMapping(value = "/product/detail.do")
	public String productDetail(int productNo, HttpSession session, Model model) {
		logger.info("ProductController productDetail! - {}");
		
		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		String memberId = memberDto.getId();
		
		Map<String, Object> productMap = productService.productDetail(memberId, productNo);
		
//		Map<String, Object> reviewMap = reviewService.review
		int reviewDto = reviewService.reviewQuantity(productNo);
		
		ProductDto productDto = (ProductDto) productMap.get("productDto");
		@SuppressWarnings("unchecked")
		Map<String, Object> productImg = (Map<String, Object>) productMap.get("imgMap");
		boolean favoriteCheck = (boolean) productMap.get("favoriteCheck");
		
		model.addAttribute("productDto", productDto);
		model.addAttribute("reviewDto", reviewDto);
		model.addAttribute("productImg", productImg);
		model.addAttribute("favoriteCheck", favoriteCheck);
		
		return "product/detail";
	}	
	
	//관리자-밀키트 관리(목록)
	@RequestMapping(value = "/product/adminList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminProductList(@RequestParam(defaultValue = "1") int curPage
			,SearchOption searchOption, Model model) {
		logger.info("ProductController adminProductList! curPage: {}, searchOption: {}", curPage, searchOption);
		
		Map<String, Object> map = productService.adminProductList(searchOption, curPage);
		
		@SuppressWarnings("unchecked")
		List<ProductDto> productList = (List<ProductDto>) map.get("productList");
		Paging paging = (Paging) map.get("paging");
		
		model.addAttribute("productList", productList);
		model.addAttribute("paging", paging);
		
		return "admin/product/adminProductList";
	}
	
	//관리자-밀키트 관리-밀키트 등록 페이지로 이동
	@RequestMapping(value = "/product/adminRegistration.do", method = RequestMethod.GET)
	public String productRegistration(Model model) {
		logger.info("ProductController productRegistration!");
		
		return "admin/product/adminProductRegistration";
	}

	//관리자-밀키트 관리-밀키트 등록
	@RequestMapping(value = "/product/adminRegistrationCtr.do", method = RequestMethod.POST)
	public String productRegistration(ProductDto productDto, 
		MultipartHttpServletRequest mulRequest, Model model) {
		logger.info("ProductController productRegistration 밀키트 등록 완료!" + productDto);
		
		try {
			productService.productRegistration(productDto, mulRequest);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/product/adminList.do";
	}	
	
	//관리자-밀키트 관리-밀키트 상세
	@RequestMapping(value = "/product/adminDetail.do", method = RequestMethod.GET)
	public String productAdminDetail(int no, Model model) {
		logger.info("ProductController productAdminDetail! - {}", no);
		
		Map<String, Object> map = productService.productAdminDetail(no);
		
		ProductDto productDto = (ProductDto) map.get("productDto");
		
		@SuppressWarnings("unchecked")
		Map<String, Object> productImg = (Map<String, Object>) map.get("imgMap");
		
		model.addAttribute("productDto", productDto);
		model.addAttribute("productImg", productImg);
		
		return "admin/product/adminProductDetail";
	}
	
	//관리자-밀키트 관리-밀키트 상세-밀키트 수정으로 이동
	@RequestMapping(value = "/product/adminModification.do", method = RequestMethod.GET)
	public String productModification(int no, Model model) {
		logger.debug("ProductController productModification!" + no);
		
		Map<String, Object> map = productService.productAdminDetail(no);
		
		ProductDto productDto = (ProductDto)map.get("productDto");
		
		@SuppressWarnings("unchecked")
		Map<String, Object> productImg = (Map<String, Object>) map.get("imgMap");
		
		
		model.addAttribute("productDto", productDto);
		model.addAttribute("productImg", productImg);
		
		return "admin/product/adminProductModification";
	}

	//관리자-밀키트 관리-밀키트 상세-밀키트 수정
	@RequestMapping(value = "/product/adminModificationCtr.do")
	public String productModificationCtr(HttpSession session, ProductDto productDto
		, MultipartHttpServletRequest mulRequest, Model model) {
		logger.info("ProductController productModificationCtr {} :: {}" , productDto);
	
		int resultNum = 0; 
			
		try {
			resultNum = productService.productModification(productDto, mulRequest);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int productNo = productDto.getNo();
		
		//DB에서 밀키트 정보가 수정됐는지 증명 
		ProductDto sessionProductDto = (ProductDto)session.getAttribute("_productDto_");
		
		if(sessionProductDto != null) {
			if(sessionProductDto.getNo() == productDto.getNo()) {
				ProductDto proofModificationDto = new ProductDto();
				
				proofModificationDto.setNo(productDto.getNo());
				proofModificationDto.setName(productDto.getName());
				proofModificationDto.setPrice(productDto.getPrice());
				proofModificationDto.setCategoryCode(productDto.getCategoryCode());
				proofModificationDto.setStock(productDto.getStock());
				proofModificationDto.setContent(productDto.getContent());
				
				session.removeAttribute("_productDto_");
				session.setAttribute("_productDto_", proofModificationDto);
			}
		}
		return "redirect:/product/adminDetail.do?no=" + productNo;
	}
	
	//관리자-밀키트 관리-밀키트 상세-밀키트 삭제
	@RequestMapping(value = "/product/deleteCtr.do", method = RequestMethod.GET)
	public String memberDelete(int no, Model model) {
		logger.info("ProductController productDelete! " + no);
		
		productService.productDelete(no);
		
		return "redirect:/product/adminList.do";
	}
	
	@ResponseBody
	@PostMapping(value="/product/ajax/quantityView.do")
	public int productQuantityView(@RequestParam int productNo) {
		
		return productService.quantityView(productNo);
	};
	
}