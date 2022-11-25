package com.mealmaker.babiyo.notice.dao;

import java.util.List;

import com.mealmaker.babiyo.notice.model.NoticeDto;


public interface NoticeDao {
	//관리자
	//리스트
	public List<NoticeDto> noticeSelectList();
	//작성
	
	//상세
	public NoticeDto noticeSelectOne(int no);
	//수정
	
	//삭제
	public void noticeDeleteOne(int no);
}
