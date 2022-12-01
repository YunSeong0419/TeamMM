package com.mealmaker.babiyo.notice.service;

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

import com.mealmaker.babiyo.favorite.model.FavoriteDto;
import com.mealmaker.babiyo.notice.dao.NoticeDao;
import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.util.FileUtils;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

@Service
public class NoticeServiceImpl implements NoticeService{

	private static final Logger log
		= LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	NoticeDao noticeDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	//관리자
	@Override
	public Map<String, Object>  noticeList(SearchOption searchOption, int curPage) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCount = noticeDao.noticeCount(searchOption);
		
		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<NoticeDto> noticeList = noticeDao.noticeList(begin, end, searchOption, curPage);
		
		map.put("paging", paging);
		map.put("noticeList", noticeList);
		
		return map;
	}
	
	@Override
	public void noticeWrite(NoticeDto noticeDto, MultipartHttpServletRequest mulRequest)
			throws Exception {
		// TODO Auto-generated method stub

		noticeDao.noticeWrite(noticeDto);
		
		// 순서대로 끄내는 로직임 잘몰름
		Iterator<String> iterator = mulRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()) {
			
			multipartFile = mulRequest.getFile(iterator.next());
//			그냥 따라해라
			
			if(multipartFile.isEmpty() == false) {
				log.debug("-------- file start --------");
				
				log.debug("name : {} ", multipartFile.getName());
				log.debug("fileName : {} ", multipartFile.getOriginalFilename());
				log.debug("size : {} ", multipartFile.getSize());
				
				log.debug("-------- file end --------\n");
			} // 콘솔에서 이미지 정보 보여주는 곳
			
		} // while end
		
		
		int parentSeq = noticeDto.getNo();
		
		List<Map<String, Object>> list 
			= fileUtils.parseInsertFileInfo(parentSeq
				, mulRequest);
		// 사진 파일을 db에 담기위해서 이름을 변경하고 여러가 로직을 수행하는 메서드
//		parentSeq
//		originalFileName
//		storedFileName
//		Size
		
		for (int i = 0; i < list.size(); i++) {
			
			// db에 사진에 대한 정보가 저장되는 부분
			// 공지번호, 원본사진 이름, 변경된 사진이름
			
			noticeDao.insertFile(list.get(i));
		}
	}
	
	@Override
	public Map<String, Object> noticeSelectOne(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		NoticeDto noticeDto = noticeDao.noticeSelectOne(no);
		Map<String, Object> imgMap = noticeDao.fileSelectOne(no);
		
		map.put("noticeDto", noticeDto);
		map.put("imgMap", imgMap);
		
		return map;
	}
	
	
	
	
	@Override
	public void noticeDeleteOne(int no) {
		// TODO Auto-generated method stub
		
		noticeDao.noticeDeleteOne(no);
	}

}
