package com.mealmaker.babiyo.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.mealmaker.babiyo.order.";
	
	@Override
	public String selectId() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "selectMember");
	}

	
	
	
}
