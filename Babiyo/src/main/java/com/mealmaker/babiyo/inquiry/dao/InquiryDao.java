package com.mealmaker.babiyo.inquiry.dao;

import java.util.List;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;

public interface InquiryDao {
	//리스트
	public List<InquiryDto> inquirySelectList();
	//작성
	public int inquiryWrite(InquiryDto inquiryDto);
	//상세
	public InquiryDto inquirySelectOne(int no);
	//수정
	public int inquiryUpdateOne(InquiryDto inquiryDto);
	//삭제
	public void inquiryDeleteOne(int no);
	
}
