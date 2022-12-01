package com.mealmaker.babiyo.notice.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.notice.model.NoticeImageDto;
import com.mealmaker.babiyo.util.SearchOption;


public interface NoticeDao {
	//관리자
	//분류
	int noticeCount(SearchOption searchOption);
	//리스트
	List<NoticeDto> noticeList(int begin, int end, SearchOption searchOption, int curPage);
	//작성
	public int noticeWrite(NoticeDto noticeDto);
	//상세
	public NoticeDto noticeSelectOne(int no);
	//수정
	
	//삭제
	public void noticeDeleteOne(int no);
	//이미지 파일 리스트
	Map<String, Object> fileSelectOne(int no);
	public Map<String, Object> fileSelectStoredFileName(int parentSeq);
	void insertFile(Map<String, Object> map);
	
	NoticeDto mainLatestNotice();
}
