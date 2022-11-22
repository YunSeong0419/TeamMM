package com.mealmaker.babiyo.inquiry.service;

import java.util.List;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;

public interface InquiryService {
	
	public List<InquiryDto> inquirySelectList();
	public void inquiry(InquiryDto inquiryDto);
}
