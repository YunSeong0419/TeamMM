package com.mealmaker.babiyo.inquiry.dao;

import java.util.List;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;

public interface InquiryDao {

	public List<InquiryDto> inquirySelectList();
	public void inquiry(InquiryDto inquiryDto);
	
}
