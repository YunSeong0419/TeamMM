package com.mealmaker.babiyo.inquiry.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.inquiry.dao.InquiryDao;
import com.mealmaker.babiyo.inquiry.model.InquiryDto;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;


@Service
public class InquiryServiceImpl implements InquiryService{

	private static final Logger log
		= LoggerFactory.getLogger(InquiryServiceImpl.class);
	
	@Autowired
	InquiryDao inquiryDao;
	//회원
	
	@Override
	public Map<String, Object> inquiryList(String memberId, int answerState, int categoryCode, int curPage) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCount = inquiryDao.memberInquiryCount(memberId, answerState, categoryCode);
		
		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<InquiryDto> inquiryList = inquiryDao.adminInquiryList(begin, end, memberId, answerState, categoryCode, curPage);
		
		
		map.put("paging", paging);
		map.put("inquiryList", inquiryList);
		
		return map;
	}

	
	
	@Override
	public int inquiryWrite(InquiryDto inquiryDto) {
		// TODO Auto-generated method stub
		
		return inquiryDao.inquiryWrite(inquiryDto);
	}

	@Override
	public Map<String, Object> inquirySelectOne(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		InquiryDto inquiryDto = inquiryDao.inquirySelectOne(no);
		resultMap.put("inquiryDto", inquiryDto);
		
		
		return resultMap;
	}

	@Override
	public int inquiryUpdateOne(InquiryDto inquiryDto) {
		// TODO Auto-generated method stub
		System.out.println(inquiryDto);
		return inquiryDao.inquiryUpdateOne(inquiryDto);
	}
	
	@Override
	public void inquiryDeleteOne(int no) {
		// TODO Auto-generated method stub
		
		inquiryDao.inquiryDeleteOne(no);
		
	}
	
	//관리자

	@Override
	public Map<String, Object> adminInquirySelectOne(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		InquiryDto inquiryDto = inquiryDao.adminInquirySelectOne(no);
		
		resultMap.put("inquiryDto", inquiryDto);
		
		return resultMap;
	}
	
	@Override
	public int adminAnswer(InquiryDto inquiryDto) {
		// TODO Auto-generated method stub
		return inquiryDao.adminAnswer(inquiryDto);
	}

	@Override
	public int adminInquiryDeleteOne(InquiryDto inquiryDto) {
		// TODO Auto-generated method stub
		return inquiryDao.adminInquiryDeleteOne(inquiryDto);
	}
	
	@Override
	public List<Map<String, Object>> categoryCodeList() {
		// TODO Auto-generated method stub
		return inquiryDao.categoryCodeList();
	}

	@Override
	public Map<String, Object> adminInquiryList(String search, int answerState, int categoryCode, int curPage){
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCount = inquiryDao.adminInquiryCount(search, answerState, categoryCode);
		
		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<InquiryDto> inquiryList = inquiryDao.adminInquiryList(begin, end, search, answerState, categoryCode, curPage);
		
		map.put("paging", paging);
		map.put("inquiryList", inquiryList);
		
		return map;
	}


}
