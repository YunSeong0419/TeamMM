package com.mealmaker.babiyo.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.product.model.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.";
	
	//DB에서 밀키트 목록 퍼오기
	@Override
	public List<ProductDto> productList(String searchOption, String sortOption
		, String keyword, int start, int end) {
	
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchOption", searchOption);
		map.put("sortOption", sortOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(namespace + "productList", map);
	}
	
	//DB에 밀키트 등록
	@Override
	public int productRegistration(ProductDto productDto) {
		
		return sqlSession.insert("com.mealmaker.babiyo.productRegistration", productDto);
	}

	//DB에서 밀키트 상세 퍼오기
	@Override
	public ProductDto productDetail(int no) {
		return sqlSession.selectOne("com.mealmaker.babiyo.productDetail", no);
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
	public int productTotalCount(String searchOption, String sortOption, String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("sortOption", sortOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "productTotalCount", map);
	}

	//파일 삽입
	@Override
	public void insertFile(Map<String, Object> map) {
	
		sqlSession.insert(namespace + "insertFile", map);
	}

	//파일 목록 보기??
	@Override
	public List<Map<String, Object>> fileSelectList(int no) {
		
		return sqlSession.selectList(namespace + "fileSelectList", no);
	}

	//파일 저장된 이름 불러오기??
	@Override
	public Map<String, Object> fileSelectStoredFileName(int parentSeq) {

		return sqlSession.selectOne(namespace + "fileSelectStoredFileName", parentSeq);
	}

	//파일 삭제
	@Override
	public int fileDelete(int parentSeq) {
		
		return sqlSession.delete(namespace + "fileDelete", parentSeq);
	}

}
