package com.mealmaker.babiyo.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.notice.model.NoticeImageDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface NoticeService {
	//관리자
	//리스트
	public Map<String, Object> noticeList(SearchOption searchOption, int curPage);
	//작성
	public void noticeWrite(NoticeDto noticeDto
			, MultipartHttpServletRequest mulRequest)throws Exception;
	//상세
	public Map<String, Object> noticeSelectOne(int no);
	//수정
	public int noticeUpdate(int no, NoticeDto noticeDto
	, MultipartHttpServletRequest mulRequest) throws Exception;
	//조회수
	public int noticeHitPlus(NoticeDto noticeDto);
	//삭제
	public void noticeDeleteOne(int no);
	//메인에 공지 리스트 가져오기
	NoticeDto mainLatestNotice();
}
