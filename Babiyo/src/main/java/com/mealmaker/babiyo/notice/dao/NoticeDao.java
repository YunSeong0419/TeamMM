package com.mealmaker.babiyo.notice.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.notice.model.NoticeImageDto;


public interface NoticeDao {
	//관리자
	//리스트
	public List<NoticeDto> noticeSelectList();
	//작성
	public int noticeWrite(NoticeDto noticeDto);
	//상세
	public NoticeDto noticeSelectOne(int no);
	//수정
	
	//삭제
	public void noticeDeleteOne(int no);
	//이미지 파일 리스트
	public List<Map<String, Object>> fileSelectList(int no);
	
	public Map<String, Object> fileSelectStoredFileName(int parentSeq);
}
