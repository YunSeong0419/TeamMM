package com.mealmaker.babiyo.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;
import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.notice.model.NoticeImageDto;

public interface NoticeService {
	//관리자
	//리스트
	public List<NoticeDto> noticeSelectList();
	//작성
//	public void noticeWrite(NoticeDto noticeDto
//			, MultipartHttpServletRequest mulRequest)throws Exception;
	//상세
//	public Map<String, Object> noticeSelectOne(int no);
	//수정
	
	//삭제
	public void noticeDeleteOne(int no);
	
}
