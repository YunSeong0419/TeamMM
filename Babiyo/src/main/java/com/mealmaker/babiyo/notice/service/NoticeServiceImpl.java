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

import com.mealmaker.babiyo.notice.dao.NoticeDao;
import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.util.FileUtils;

@Service
public class NoticeServiceImpl implements NoticeService{

	private static final Logger Log
		= LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	NoticeDao noticeDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	//관리자
	@Override
	public List<NoticeDto> noticeSelectList() {
		// TODO Auto-generated method stub
		return noticeDao.noticeSelectList();
	}
	
//	@Override
//	public void noticeWrite(NoticeDto noticeDto,
//			MultipartHttpServletRequest mulRequest) throws Exception {
//		// TODO Auto-generated method stub
//		
//		noticeDao.noticeWrite(noticeDto);
//		
//		Iterator<String> inIterator = mulRequest.getFileNames();
//		MultipartFile multipartFile = null;
//		
//		while(inIterator.hasNext()) {
//			multipartFile = mulRequest.getFile(iterator)
//		}
		
//	}
//	
//	@Override
//	public Map<String, Object> noticeSelectOne(int no) {
//		// TODO Auto-generated method stub
//		
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		
//		NoticeDto noticeDto = noticeDao.noticeSelectOne(no);
//		resultMap.put("noticeDto", noticeDto);
//		
//		List<Map<String, Object>> fileList = noticeDao.fileSelectList(no);
//		resultMap.put("fileList", fileList);
//		
//		return resultMap;
//	}
	
	
	
	
	@Override
	public void noticeDeleteOne(int no) {
		// TODO Auto-generated method stub
		
		noticeDao.noticeDeleteOne(no);
	}

}
