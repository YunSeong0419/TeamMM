package com.mealmaker.babiyo.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.util.SearchOption;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.product.";
	
	//DB에서 밀키트 목록 퍼오기
	@Override
	public List<ProductDto> productList(SearchOption searchOption, int begin, int end) {
	
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("sort", searchOption.getSort());
		paramMap.put("searchOption", searchOption.getSearchOption());
		paramMap.put("search", searchOption.getSearch());
		paramMap.put("begin", begin);
		paramMap.put("end", end);
		
		return sqlSession.selectList(namespace + "productList", paramMap);
	}
	
	//DB에 밀키트 등록
	@Override
	public int productRegistration(ProductDto productDto) {
		
		return sqlSession.insert(namespace + "productRegistration", productDto);
	}

	//DB에서 밀키트 상세정보 조회
	@Override
	public ProductDto productDetail(int no) {
		return sqlSession.selectOne(namespace + "productDetail", no);
	}

	//DB에 있는 밀키트 수정
	@Override
	public int productModification(ProductDto productDto) {
		
		return sqlSession.update(namespace + "productModification", productDto);
	}

	//DB에서 밀키트 삭제
	@Override
	public void productDelete(int no) {

		sqlSession.delete(namespace + "productDelete", no);
	}

	//???
	@Override
	public int productCount(SearchOption searchOption) {
		
		return sqlSession.selectOne(namespace + "productCount", searchOption);
	}

	@Override
	public int categoryCount(SearchOption searchOption) {
		
		return sqlSession.selectOne(namespace + "categoryCount", searchOption);
	}

	//파일 삽입
	@Override
	public void insertFile(Map<String, Object> map) {
	
		sqlSession.insert(namespace + "insertFile", map);
	}

	//파일 불러오기
	public Map<String, Object> fileSelectOne(int productNo) {
		
		return sqlSession.selectOne(namespace + "fileSelectOne", productNo);
	}


	//파일 저장된 이름 불러오기??
	@Override
	public String fileSelectStoredFileName(int parentSeq) {

		return sqlSession.selectOne(namespace + "fileSelectStoredFileName", parentSeq);
	}

	//파일 삭제
	@Override
	public int fileDelete(int parentSeq) {
		
		return sqlSession.delete(namespace + "fileDelete", parentSeq);
	}
	
	//DB에 있는 카테고리 정보 퍼오기
	@Override
	public List<Map<String, Object>> productCategory() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "productCategory");
	}
	
	//DB에 있는 카테고리별 리스트 퍼오기
	@Override
	public List<ProductDto> categoryList(SearchOption searchOption, int begin, int end) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("search", searchOption.getSearch());
		map.put("categoryCode", searchOption.getCategoryCode());
		map.put("begin", begin);
		map.put("end", end);
		
		return sqlSession.selectList(namespace + "categoryList", map);
	}
	
	//DB에 있는 신상 밀키트 리스트 퍼오기
	@Override
	public List<ProductDto> newProductList() {
		
		return sqlSession.selectList(namespace + "newProductList");
	}
	
	//DB에 있는 추천 밀키트 리스트 퍼오기
	@Override
	public List<ProductDto> recommendProductList(String memberId, int listNo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("memberId", memberId);
		paramMap.put("listNo", listNo);
		
		return sqlSession.selectList(namespace + "recommendProductList", paramMap);
	}

	@Override
	public int stockView(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "stockView", productNo);
	}

	@Override
	public void stockUpdate(int productNo, int stock) {
		// TODO Auto-generated method stub
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("productNo", productNo);
		paraMap.put("stock", stock);
		
		sqlSession.update(namespace + "stockUpdate", paraMap);
	}
}
