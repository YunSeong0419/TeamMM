package com.mealmaker.babiyo.inquiry.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface InquiryDao {
	
	public List<Map<String, Object>> categoryCodeList(); 
	
	
	int adminInquiryCount(String search, int answerState, int categoryCode);
	 int memberInquiryCount(String id, int answerState, int categoryCode);
	
	//회원
	//리스트
	List<InquiryDto> inquiryList(int begin, int end, String memberId, int answerState, int categoryCode,
			int curPage);
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
	List<InquiryDto> adminInquiryList(int begin, int end, String search, int answerState, int categoryCode,
			int curPage);
	//상세
	public InquiryDto adminInquirySelectOne(int no);
	//문의 답변  , 수정
	public int adminAnswer(InquiryDto inquiryDto);
	//삭제
	public int adminInquiryDeleteOne(InquiryDto inquiryDto);

	public int waitInquiryCount();




}
