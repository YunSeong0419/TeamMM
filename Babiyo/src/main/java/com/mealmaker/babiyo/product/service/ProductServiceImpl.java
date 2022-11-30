package com.mealmaker.babiyo.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.favorite.dao.FavoriteDao;
import com.mealmaker.babiyo.favorite.model.FavoriteDto;
import com.mealmaker.babiyo.product.dao.ProductDao;
import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.util.FileUtils;

@Service
public class ProductServiceImpl implements ProductService{

	//log4j 사용
	private static final Logger logger
		= LoggerFactory.getLogger(ProductServiceImpl.class);
	
	//이미지 첨삭용 보조프로그램
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource
	private FavoriteDao favoriteDao;
	
	@Autowired
	public ProductDao productDao;
	
	//DAO에서 밀키트 목록 꺼내오게 시키기
	@Override
	public List<ProductDto> productList(String searchOption, String sortOption, 
		String keyword, int start, int end) {
		
		return productDao.productList(searchOption, sortOption, keyword, start, end);
	}

	//DAO에 밀키트 등록하게 시키기
	@Override
	public void productRegistration(ProductDto productDto, 
			MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		
		productDao.productRegistration(productDto);
		//파일 넣기
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				logger.debug("-------- file start --------");
				
				logger.debug("name : {} ", multipartFile.getName());
				logger.debug("fileName : {} ", multipartFile.getOriginalFilename());
				logger.debug("size : {} ", multipartFile.getSize());
				
				logger.debug("-------- file end --------\n");
			}
		}
		
		int parentSeq = productDto.getNo();
		
		List<Map<String, Object>> list 
			= fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
		
		for (int i = 0; i < list.size(); i++) {
			productDao.insertFile(list.get(i));
		}
	}	//void라서 리턴 없음

	//DAO에서 관리자 밀키트 상세 꺼내오게 시키기
	@Override
	public Map<String, Object> productAdminDetail(int no) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		ProductDto productDto = productDao.productDetail(no);
		Map<String, Object> fileSelectOne = productDao.fileSelectOne(no);
		
		resultMap.put("productDto", productDto);
		resultMap.put("fileSelectOne", fileSelectOne);
		
		return resultMap;
	}

	//DAO에 밀키트 상세 변경하게 시키기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int productModification(ProductDto productDto, 
			MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx) 
			throws Exception {
		
		int resultNum = 0;
		
		try {
			resultNum = productDao.productModification(productDto);
			
			int parentSeq = productDto.getNo();
			Map<String, Object> tempFileMap 
				= productDao.fileSelectStoredFileName(parentSeq);
			
			List<Map<String, Object>> list 
				= fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
			
			// 하나의 파일만 가능하도록 구현
			if(list.isEmpty() == false) {
				if(tempFileMap != null) {
					productDao.fileDelete(parentSeq);
					fileUtils.parseUpdateFileInfo(tempFileMap);
				}
				
				for (Map<String, Object> map : list) {
					productDao.insertFile(map);
				}
			}else if(fileIdx == -1) {
				if(tempFileMap != null) {
					productDao.fileDelete(parentSeq);
					fileUtils.parseUpdateFileInfo(tempFileMap);
				}
			}
		}catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return resultNum;
	}

	//DAO에서 밀키트 삭제하게 시키기
	@Override
	public void productDelete(int no) {
		
		productDao.productDelete(no);		
	}
	
	//???
	@Override
	public int productTotalCount(String searchOption, String sortOption, String keyword) {

		return productDao.productTotalCount(searchOption, sortOption, keyword);
	}
	
	//DAO에서 신상 밀키트 가져오게 시키기
	@Override
	public List<Map<String, Object>> newProductList() {
		List<ProductDto> newProductList = productDao.newProductList();
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for (ProductDto productDto : newProductList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int productNo = productDto.getNo();
			Map<String, Object> imgMap = productDao.fileSelectOne(productNo);
			
			map.put("productDto", productDto);
			map.put("imgMap", imgMap);
			
			list.add(map);
		}
		
		return list;
	}

	//DAO에서 추천 밀키트 가져오게 시키기
	@Override
	public List<Map<String, Object>> recommendProductList(String memberId) {

		List<ProductDto> interestListOne = productDao.recommendProductList(memberId, 1);
		List<ProductDto> interestListTwo = productDao.recommendProductList(memberId, 2);
		
		
		List<ProductDto> recommendProductList = new ArrayList<ProductDto>();
		
		recommendProductList.addAll(interestListOne);
		recommendProductList.addAll(interestListTwo);
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for (ProductDto productDto : recommendProductList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int productNo = productDto.getNo();
			
			Map<String, Object> imgMap = productDao.fileSelectOne(productNo);
			
			map.put("productDto", productDto);
			map.put("imgMap", imgMap);
			
			list.add(map);
		}
		
		return null;
	}
	
	//회원 밀키트 상세보기
	@Override
	public Map<String, Object> productMemberDetail(String memberId, int productNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ProductDto productDto = productDao.productDetail(productNo);
		Map<String, Object> imgMap = productDao.fileSelectOne(productNo);
		
		FavoriteDto favoriteDto = new FavoriteDto();
		
		favoriteDto.setMemberId(memberId);
		favoriteDto.setProductNo(productNo);
		
		String memberIdCheck = favoriteDao.favoriteCheck(favoriteDto);
		
		boolean favoriteCheck = memberId.equals(memberIdCheck);
		
		map.put("productDto", productDto);
		map.put("imgMap", imgMap);
		map.put("favoriteCheck", favoriteCheck);
		
		return map;
	}
	
}
