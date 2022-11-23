package com.mealmaker.babiyo.inquiry.service;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;

public interface InquiryService {
	//리스트
	public List<InquiryDto> inquirySelectList();
	//작성
	public int inquiryWrite(InquiryDto inquiryDto);
	//상세
	public Map<String, Object> inquirySelectOne(int no);
	//수정
	public int inquiryUpdateOne(InquiryDto inquiryDto);
	//삭제
	public void inquiryDeleteOne(int no);
}
