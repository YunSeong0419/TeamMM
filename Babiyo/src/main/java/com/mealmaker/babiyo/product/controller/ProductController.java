package com.mealmaker.babiyo.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.product.service.ProductService;
import com.mealmaker.babiyo.util.Paging;

@Controller
public class ProductController {

	private static final Logger logger 
		= LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductService productService;
	
	//오븐 15p, 헤더-밀키트 카테고리
	@RequestMapping(value = "/product/category.do", method = RequestMethod.GET)
	public String productCategory(Model model) {
		logger.info("MainController category! ");

		List<Map<String, Object>> productCategory = productService.productCategory();
		
		model.addAttribute("productCategory", productCategory);
		
		return "product/category";
	}
	
	//오븐 21p 회원-밀키트 상세
	@RequestMapping(value = "/product/detail.do")
	public String productMemberDetail(int productNo, HttpSession session, Model model) {
		logger.info("ProductController productMemberDetail! - {}");
		
		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		String memberId = memberDto.getId();
		
		Map<String, Object> productMap = productService.productMemberDetail(memberId, productNo);
		
		ProductDto productDto = (ProductDto) productMap.get("productDto");
		@SuppressWarnings("unchecked")
		Map<String, Object> productImg = (Map<String, Object>) productMap.get("imgMap");
		boolean favoriteCheck = (boolean) productMap.get("favoriteCheck");
		
		model.addAttribute("productDto", productDto);
		model.addAttribute("productImg", productImg);
		model.addAttribute("favoriteCheck", favoriteCheck);
		
		return "product/detail";
	}
	//오븐 56p 관리자-밀키트 관리(목록)
	@RequestMapping(value = "/product/adminList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String productList(@RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "STOCK ASC") String sortOption
			, @RequestParam(defaultValue = "") String keyword
			, Model model) {
		logger.info("ProductController productList! curPage: {}, searchOption: {}"
				, curPage, searchOption);
		logger.info("sortOption: {}, keyword: {}", sortOption, keyword);		
	
		int totalCount = 
			productService.productTotalCount(searchOption, sortOption, keyword);
		
		Paging paging = new Paging(totalCount, curPage);
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<ProductDto> productList = 
			productService.productList(searchOption, sortOption, keyword, start, end);

		Map<String, Object> searchAndSortMap = new HashMap<>();
		searchAndSortMap.put("searchOption", searchOption);
		searchAndSortMap.put("sortOption", sortOption);
		searchAndSortMap.put("keyword", keyword);
		
		model.addAttribute("productList", productList);
		model.addAttribute("searchMap", searchAndSortMap);
		model.addAttribute("sortMap", searchAndSortMap);
		model.addAttribute("paging", paging);
		
		return "admin/product/adminProductList";
	}
	
	//오븐 56p 관리자-밀키트 관리-밀키트 등록으로 가기
	@RequestMapping(value = "/product/adminRegistration.do", method = RequestMethod.GET)
	public String productRegistration(Model model) {
		logger.info("ProductController productRegistration!");
		
		return "admin/product/adminProductRegistration";
	}

	//오븐 57p 관리자-밀키트 관리-밀키트 등록
	@RequestMapping(value = "/product/adminRegistrationCtr.do", method = RequestMethod.POST)
	public String productRegistration(ProductDto productDto, 
		MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		logger.info("ProductController productRegistration 밀키트 등록 완료!" + productDto);
		
		try {
			productService.productRegistration(productDto, multipartHttpServletRequest);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/product/adminList.do";
	}
	
	//오븐 58p 관리자-밀키트 관리-밀키트 상세
	@RequestMapping(value = "/product/adminDetail.do")
	public String productAdminDetail(int no , @RequestParam(defaultValue = "1") int curPage
			, String searchOption, String sortOption, String keyword, Model model) {
		logger.info("ProductController productAdminDetail! - {}", no);
		
		Map<String, Object> map = productService.productAdminDetail(no);
	
		ProductDto productDto = (ProductDto) map.get("productDto");
	
		List<Map<String, Object>> fileList 
			= (List<Map<String, Object>>) map.get("fileList");
		
		Map<String, Object> prevMap = new HashMap<>();
		prevMap.put("curPage", curPage);
		prevMap.put("searchOption", searchOption);
		prevMap.put("sortOption", sortOption);
		prevMap.put("keyword", keyword);
		
		model.addAttribute("productDto", productDto);
		model.addAttribute("fileList", fileList);
		model.addAttribute("prevMap", prevMap);
		
		return "admin/product/adminProductDetail";
	}

	//오븐 58p 관리자-밀키트 관리-밀키트 상세-밀키트 수정으로 가기
	@RequestMapping(value = "/product/adminModification.do", method = RequestMethod.GET)
	public String productModification(int no, Model model) {
		logger.debug("ProductController productModification!" + no);
		
		Map<String, Object> map = productService.productAdminDetail(no);
		
		ProductDto productDto = (ProductDto)map.get("productDto");
		
		List<Map<String, Object>> fileList 
			= (List<Map<String, Object>>) map.get("fileList");
		
		model.addAttribute("productDto", productDto);
		model.addAttribute("fileList", fileList);
		
		return "admin/product/adminProductModification";
	}

	//오븐 58p 관리자-밀키트 관리-밀키트 상세-밀키트 수정
	@RequestMapping(value = "/product/adminModificationCtr.do", method = RequestMethod.POST)
	public String productModificationCtr(HttpSession session, ProductDto productDto
		, @RequestParam(value = "fileIdx", defaultValue = "-1") int fileIdx
		, MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		logger.info("ProductController productModificationCtr {} :: {}" , productDto, fileIdx);
		
		int resultNum = 0; 
			
		try {
			resultNum = productService.productModification(productDto, multipartHttpServletRequest, fileIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		return "admin/product/adminProductModificationSuccess";
	}
	
	//오븐 58p 관리자-밀키트 관리-밀키트 상세-밀키트 삭제
	@RequestMapping(value = "/product/deleteCtr.do", method = RequestMethod.GET)
	public String memberDelete(int no, Model model) {
		logger.info("ProductController productDelete! " + no);
		
		productService.productDelete(no);
		
		return "redirect:/product/adminList.do";
	}
	
	
	
}