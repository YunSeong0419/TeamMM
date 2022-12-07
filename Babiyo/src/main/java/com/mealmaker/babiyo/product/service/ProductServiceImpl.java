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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.favorite.dao.FavoriteDao;
import com.mealmaker.babiyo.favorite.model.FavoriteDto;
import com.mealmaker.babiyo.product.dao.ProductDao;
import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.util.FileUtils;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

@Service
public class ProductServiceImpl implements ProductService{

	//log4j 사용
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	//이미지 첨삭용 보조프로그램
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource
	private FavoriteDao favoriteDao;
	
	@Autowired
	public ProductDao productDao;
	
	//DAO에서 밀키트 목록 꺼내오게 시키기
	@Override
	public Map<String, Object> adminProductList(SearchOption searchOption, int curPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCount = productDao.productCount(searchOption);

		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<ProductDto> productList = productDao.productList(searchOption, begin, end);
		
		map.put("productList", productList);
		map.put("paging", paging);
		
		return map;
	}

	//DAO에 밀키트 등록하게 시키기
	@Override
	public void productRegistration(ProductDto productDto, 
			MultipartHttpServletRequest mulRequest) throws Exception {
		
		productDao.productRegistration(productDto);
		//파일 넣기
		Iterator<String> iterator = mulRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()) {
			multipartFile = mulRequest.getFile(iterator.next());
			
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
			= fileUtils.parseInsertFileInfo(parentSeq, mulRequest);
		
		for (int i = 0; i < list.size(); i++) {
			productDao.insertFile(list.get(i));
		}
	}

	//DAO에서 관리자 밀키트 상세 꺼내오게 시키기
	@Override
	public Map<String, Object> productAdminDetail(int no) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		ProductDto productDto = productDao.productDetail(no);
		Map<String, Object> imgMap = productDao.fileSelectOne(no);
		
		resultMap.put("productDto", productDto);
		resultMap.put("imgMap", imgMap);
		
		return resultMap;
	}

	//DAO에 밀키트 상세 변경하게 시키기
	@Override
	public int productModification(ProductDto productDto, MultipartHttpServletRequest mulRequest) 
		throws Exception {
		
		int resultNum = 0;
		
		resultNum = productDao.productModification(productDto);
		
		int no = productDto.getNo();
			
		Iterator<String> iterator = mulRequest.getFileNames();
		MultipartFile multipartFile = null;

		while (iterator.hasNext()) {

			multipartFile = mulRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				logger.debug("-------- file start --------");
				logger.debug("name : {} ", multipartFile.getName());
				logger.debug("fileName : {} ", multipartFile.getOriginalFilename());
				logger.debug("size : {} ", multipartFile.getSize());
				logger.debug("-------- file end --------\n");
			} // 콘솔에서 이미지 정보 보여주는 곳
		}
		
		try {
			int parentSeq = productDto.getNo();
			
			List<Map<String, Object>> list 
				= fileUtils.parseInsertFileInfo(parentSeq, mulRequest);
	
			Map<String, Object> imgMap = productDao.fileSelectOne(no);
			
			if(!list.isEmpty()) {
				if (!imgMap.isEmpty()) {
					productDao.fileDelete(parentSeq);
					fileUtils.parseUpdateFileInfo(imgMap);
					
					for (Map<String, Object> map : list) {
						productDao.insertFile(map);
					}
				}
			}
			
		}catch (Exception e) { 
//		 	TransactionAspectSupport.currentTransactionStatus() 
// 				.setRollbackOnly();
			e.printStackTrace();
		}	 
		return resultNum;
	}

	//DAO에서 밀키트 삭제하게 시키기
	@Override
	public void productDelete(int no) {
		
		productDao.fileDelete(no);
		productDao.productDelete(no);		
	}
	
	//검색옵션, 분류 있는 애들의 개수 계산
	@Override
	public int productCount(SearchOption searchOption) {

		return productDao.productCount(searchOption);
	}
	
	//카테고리 페이지에서의 개수 계산
	@Override
	public int categoryCount(SearchOption searchOption) {

		return productDao.categoryCount(searchOption);
	}

	//DAO에서 카테고리 정보 가져오게 시키기
	@Override
	public List<Map<String, Object>> productCategory() {
		
		return productDao.productCategory();
	}
	
	//DAO에서 카테고리별 밀키트 가져오게 시키기
	@Override
	public List<Map<String, Object>> categoryList(SearchOption searchOption, int begin, int end) {
		

		List<ProductDto> categoryList = productDao.categoryList(searchOption, begin, end);
		
		List<Map<String, Object>> productCategory = new ArrayList<Map<String,Object>>();
		
		for (ProductDto productDto : categoryList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int productNo = productDto.getNo();
			Map<String, Object> imgMap = productDao.fileSelectOne(productNo);
			
			map.put("productDto", productDto);
			map.put("imgMap", imgMap);
			
			productCategory.add(map);
		}
		
		return productCategory;
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
		
		return list;
	}
	
	//회원 밀키트 상세보기
	@Override
	public Map<String, Object> productDetail(String memberId, int productNo) {
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
