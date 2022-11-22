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


@Service
public class InquiryServiceImpl implements InquiryService{

	private static final Logger log
		= LoggerFactory.getLogger(InquiryServiceImpl.class);
	
	@Autowired
	InquiryDao inquiryDao;

	@Override
	public List<InquiryDto> inquirySelectList() {
		// TODO Auto-generated method stub
		return inquiryDao.inquirySelectList();
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
	public void inquiryDeleteOne(int no) {
		// TODO Auto-generated method stub
		
		inquiryDao.inquiryDeleteOne(no);
		
	}

}
