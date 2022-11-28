package com.mealmaker.babiyo.product.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.product.model.ProductDto;

public interface ProductDao {
	//목록	
	public List<ProductDto> productList(String searchOption, String sortOption,
			String keyword,	int start, int end);
	//등록
	public int productRegistration(ProductDto productDto);
	//관리자 밀키트 상세
	public ProductDto productDetail(int no);
	//수정	
	public int productModification(ProductDto productDto);
	//삭제
	public void productDelete(int no);
	//???
	public int productTotalCount(String searchOption, String sortOption, String keyword);
	//이미지 첨삭
	public void insertFile(Map<String, Object> map);
	Map<String, Object> fileSelectOne(int no);
	public Map<String, Object> fileSelectStoredFileName(int parentSeq);
	public int fileDelete(int parentSeq);
	//메인에 신상 밀키트 쏴주기
	List<ProductDto> newProductList();
}

