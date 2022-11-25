package com.mealmaker.babiyo.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.notice.dao.NoticeDao;
import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.notice.model.NoticeImageDto;

@Service
public class NoticeServiceImpl implements NoticeService{

	private static final Logger Log
		= LoggerFactory.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	NoticeDao noticeDao;
	//관리자
	@Override
	public List<NoticeDto> noticeSelectList() {
		// TODO Auto-generated method stub
		return noticeDao.noticeSelectList();
	}
	
	@Override
	public int noticeWrite(NoticeDto noticeDto, NoticeImageDto noticeImageDto) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Map<String, Object> noticeSelectOne(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		NoticeDto noticeDto = noticeDao.noticeSelectOne(no);
		resultMap.put("noticeDto", noticeDto);
		
		return resultMap;
	}
	
	
	
	
	@Override
	public void noticeDeleteOne(int no) {
		// TODO Auto-generated method stub
		
		noticeDao.noticeDeleteOne(no);
	}

}
