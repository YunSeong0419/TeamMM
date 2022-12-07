package com.mealmaker.babiyo.inquiry.service;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface InquiryService {
	//회원
	//카테고리 분류
	public List<Map<String, Object>> categoryCodeList();
	//리스트
	public Map<String, Object> inquiryList(String memberId, int answerState, int categoryCode, int curPage);
	//작성
	public int inquiryWrite(InquiryDto inquiryDto);
	//상세
	public Map<String, Object> inquirySelectOne(int no);
	//수정
	public int inquiryUpdateOne(InquiryDto inquiryDto);
	//삭제
	public void inquiryDeleteOne(int no);
	//관리자
	//리스트
	public Map<String, Object> adminInquiryList(String search, int answerState, int categoryCode, int curPage);
	//상세
	public Map<String, Object> adminInquirySelectOne(int no);
	//문의 답변 , 수정
	public int adminAnswer(InquiryDto inquiryDto);
	//삭제
	public int adminInquiryDeleteOne(InquiryDto inquiryDto);

}
