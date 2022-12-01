package com.mealmaker.babiyo.inquiry.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;
import com.mealmaker.babiyo.util.SearchOption;

@Repository
public class InquiryDaoImpl implements InquiryDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.inquiry.";
	//회원
	@Override
	public int memberInquiryCount(String memberId, int answerState, int categoryCode) {
		// TODO Auto-generated method stub
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("memberId", memberId);
		paraMap.put("answerState", answerState);
		paraMap.put("categoryCode", categoryCode);

		return sqlSession.selectOne(namespace + "memberInquiryCount", paraMap);
	}

	@Override
	public List<InquiryDto> inquiryList(int begin, int end, String memberId, int answerState, int categoryCode,
			int curPage) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("begin", begin);
		paraMap.put("end", end);
		paraMap.put("memberId", memberId);
		paraMap.put("answerState", answerState);
		paraMap.put("categoryCode", categoryCode);
		paraMap.put("curPage", curPage);
		
		
		return sqlSession.selectList(namespace + "inquiryList", paraMap);
	}
	
	@Override
	public int inquiryWrite(InquiryDto inquiryDto) {
		return sqlSession.insert(namespace + "inquiryWrite", inquiryDto);
		
	}

	@Override
	public InquiryDto inquirySelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"inquirySelectOne", no);
	}

	@Override
	public int inquiryUpdateOne(InquiryDto inquiryDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "inquiryUpdateOne", inquiryDto);
	}
	
	@Override
	public void inquiryDeleteOne(int no) {
		// TODO Auto-generated method stub
		 sqlSession.delete(namespace + "inquiryDeleteOne", no);
	}
	
	//관리자
	
	@Override
	public int adminInquiryCount(String search, int answerState, int categoryCode) {
		// TODO Auto-generated method stub
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("search", search);
		paraMap.put("answerState", answerState);
		paraMap.put("categoryCode", categoryCode);
		
		return sqlSession.selectOne(namespace + "adminInquiryCount", paraMap);
	}
	
	@Override
	public List<InquiryDto> adminInquiryList(int begin, int end, String search
			, int answerState, int categoryCode, int curPage) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("begin", begin);
		paraMap.put("end", end);
		paraMap.put("search", search);
		paraMap.put("answerState", answerState);
		paraMap.put("categoryCode", categoryCode);
		paraMap.put("curPage", curPage);
		
		
		return sqlSession.selectList(namespace + "adminInquiryList", paraMap);
	}
	
	@Override
	public InquiryDto adminInquirySelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace +"adminInquirySelectOne", no);
	}

	@Override
	public int adminAnswer(InquiryDto inquiryDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "adminAnswer", inquiryDto);
	}

	@Override
	public int adminInquiryDeleteOne(InquiryDto inquiryDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "adminDeleteOne", inquiryDto);
	}

	@Override
	public List<Map<String, Object>> categoryCodeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "inquiryCategoeyList");
	}


}
