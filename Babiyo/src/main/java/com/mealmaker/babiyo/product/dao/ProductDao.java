package com.mealmaker.babiyo.product.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface ProductDao {
	//목록	
	public List<ProductDto> productList(SearchOption searchOption, int curPage, int begin);
	//등록
	public int productRegistration(ProductDto productDto);
	//관리자 밀키트 상세
	public ProductDto productDetail(int no);
	//수정	
	public int productModification(ProductDto productDto);
	//삭제
	public void productDelete(int no);
	//???
	public int productCount(SearchOption searchOption);
	//이미지 첨삭
	public void insertFile(Map<String, Object> map);
	Map<String, Object> fileSelectOne(int no);
	public Map<String, Object> fileSelectStoredFileName(int parentSeq);
	public int fileDelete(int parentSeq);
	//카테고리 정보 가져오기
	public List<Map<String, Object>> productCategory();
	//카테고리에 밀키트 쏴주기
	public int categoryCount(SearchOption searchOption);
	List<ProductDto> categoryList(SearchOption searchOption, int begin, int end);
	//메인에 신상 밀키트 쏴주기
	List<ProductDto> newProductList();
	//메인에 추천 밀키트 쏴주기
	List<ProductDto> recommendProductList(String memberId, int listNo);
}

