package com.mealmaker.babiyo.cash.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.member.model.InterestDto;
import com.mealmaker.babiyo.member.model.MemberDto;

@Repository
public class CashDaoImpl implements CashDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.cash.";
	
	@Override
	public void cashChargeOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		 sqlSession.update(namespace + "cashUpdateOne"
			, memberDto);
	}

	

}
