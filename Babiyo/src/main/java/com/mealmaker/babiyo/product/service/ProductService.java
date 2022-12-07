package com.mealmaker.babiyo.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface ProductService {
	
	//카테고리에 리스트 쏴주기
	List<Map<String, Object>> categoryList(SearchOption searchOption, int begin, int end);
	//목록
	public Map<String, Object> adminProductList(SearchOption searchOption, int curPage);
	//등록
	public void productRegistration(ProductDto productDto
		, MultipartHttpServletRequest mulRequest) throws Exception;
	//관리자-밀키트 상세
	Map<String, Object> productAdminDetail(int no);
	//수정	
	public int productModification(ProductDto productDto
		, MultipartHttpServletRequest mulRequest) throws Exception;
	//관리자-밀키트 삭제
	public void productDelete(int no);
	
	//밀키트 조회 개수
	public int productCount(SearchOption searchOption);
	//카테고리 조회 개수
	public int categoryCount(SearchOption searchOption);
	//카테고리 정보 가져오기
	public List<Map<String, Object>> productCategory();
	//메인에 신상 밀키트 쏴주기
	List<Map<String, Object>> newProductList();
	//메인에 추천 밀키트 쏴주기
	List<Map<String, Object>> recommendProductList(String memberId);
	public Map<String, Object> productDetail(String memberId, int productNo);
	int quantityView(int productNo);
}
