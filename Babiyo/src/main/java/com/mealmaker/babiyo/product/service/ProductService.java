package com.mealmaker.babiyo.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface ProductService {
	//목록
	public Map<String, Object> adminProductList(SearchOption searchOption, int curPage);
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
	public int productCount(SearchOption searchOption);
	//???
	public int categoryCount(SearchOption searchOption);
	//카테고리 정보 가져오기
	public List<Map<String, Object>> productCategory();
	//카테고리 리스트 쏴주기
	List<Map<String, Object>> categoryList(SearchOption searchOption, int begin, int end);
	//메인에 신상 밀키트 쏴주기
	List<Map<String, Object>> newProductList();
	//메인에 추천 밀키트 쏴주기
	List<Map<String, Object>> recommendProductList(String memberId);
	public Map<String, Object> productDetail(String memberId, int productNo);
}
