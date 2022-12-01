package com.mealmaker.babiyo.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.product.model.ProductDto;

public interface ProductService {
	//목록
	public List<ProductDto> productList(String searchOption, String sortOption,
		String keyword,	int start, int end);
	//등록
	public void productRegistration(ProductDto productDto
		, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;
	//관리자 밀키트 상세
	Map<String, Object> productAdminDetail(int no);
	//수정	
	public int productModification(ProductDto productDto
		, MultipartHttpServletRequest multipartHttpServletRequest
		, int fileIdx) throws Exception;
	//삭제
	public void productDelete(int no);
	//???
	public int productTotalCount(String searchOption, String sortOption, String keyword);
	//카테고리 리스트 쏴주기
	List<Map<String, Object>> productCategory(String classification, String keyword);
	//메인에 신상 밀키트 쏴주기
	List<Map<String, Object>> newProductList();
	//메인에 추천 밀키트 쏴주기
	List<Map<String, Object>> recommendProductList(String memberId);
	public Map<String, Object> productMemberDetail(String memberId, int productNo);
}
