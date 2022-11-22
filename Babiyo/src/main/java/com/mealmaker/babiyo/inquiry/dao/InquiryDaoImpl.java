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
	public List<InquiryDto> inquirySelectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace +"inquirytList");
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
	public void inquiryDeleteOne(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "inquiryDeleteOne", no);
		
	}

}
