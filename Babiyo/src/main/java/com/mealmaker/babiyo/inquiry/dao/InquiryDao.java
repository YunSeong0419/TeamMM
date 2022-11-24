package com.mealmaker.babiyo.inquiry.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;

public interface InquiryDao {
	//회원
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
	//관리자
	//리스트
	public List<InquiryDto> adminInquirySelectList();
	//상세
	public InquiryDto adminInquirySelectOne(int no);
	//문의 답변  , 수정
	public int adminAnswer(InquiryDto inquiryDto);
	//삭제
	public int adminInquiryDeleteOne(InquiryDto inquiryDto);
}
