package com.mealmaker.babiyo.inquiry.service;

import java.util.List;

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
	public void inquiry(InquiryDto inquiryDto) {
		// TODO Auto-generated method stub
		
		return;
	}

}
