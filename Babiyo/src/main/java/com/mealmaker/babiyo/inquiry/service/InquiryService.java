package com.mealmaker.babiyo.inquiry.service;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;

public interface InquiryService {
	
	public List<InquiryDto> inquirySelectList();
	public int inquiryWrite(InquiryDto inquiryDto);
	
	public Map<String, Object> inquirySelectOne(int no);
	
	public void inquiryDeleteOne(int no);
}
