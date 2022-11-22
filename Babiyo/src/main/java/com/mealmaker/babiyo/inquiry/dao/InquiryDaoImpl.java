package com.mealmaker.babiyo.inquiry.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;

@Repository
public class InquiryDaoImpl implements InquiryDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.inquiry.";
	
	@Override
	public void inquiry(InquiryDto inquiryDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "inquiry", inquiryDto);
		
	}

	@Override
	public List<InquiryDto> inquirySelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +"inquirytList");
	}

}
