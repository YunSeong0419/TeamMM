package com.mealmaker.babiyo.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.util.SearchOption;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.notice.";
	//관리자
		
	@Override
	public int noticeCount(SearchOption searchOption) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "noticeCount", searchOption);
	}
	
	@Override
	public List<NoticeDto> noticeList(int begin, int end, SearchOption searchOption
			, int curPage) {
		// TODO Auto-generated method stub
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("begin", begin);
		paraMap.put("end", end);
		paraMap.put("curPage", curPage);
		paraMap.put("search", searchOption.getSearch());
		paraMap.put("searchOption", searchOption.getSearchOption());
		paraMap.put("stateCode", searchOption.getStateCode());
		
		return sqlSession.selectList(namespace + "noticeList", paraMap);
	}

	//파일추가
	@Override
	public void insertFile(Map<String, Object> map) {
			// TODO Auto-generated method stub
			sqlSession.insert(namespace + "insertFile", map);
	}
	//게시글 등록
	@Override
	public int noticeWrite(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "noticeWrite", noticeDto);
	}
	//상세
	@Override
	public NoticeDto noticeSelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"noticeSelectOne", no);
	}
	
	@Override
	public Map<String, Object> fileSelectStoredFileName(int no) {

		return sqlSession.selectOne(namespace + "fileSelectStoredFileName", no);
	}


	@Override
	public Map<String, Object> fileSelectOne(int no) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "fileSelectOne", no);
	}
	
	@Override
	public NoticeDto mainLatestNotice() {
		
		return sqlSession.selectOne(namespace + "mainLatestNotice");
	}

	@Override
	public int noticeUpdate(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "noticeUpdate", noticeDto);
	}
	
	@Override
	public int noticeHitPlus(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "noticeHitPlus", noticeDto);
	}


	@Override
	public int fileDelete(int parentSeq) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "fileDelete", parentSeq);
	}

	@Override
	public void noticeDeleteOne(int no) {
		// TODO Auto-generated method stub
		 sqlSession.delete(namespace + "noticeDeleteOne", no);
	}


}
