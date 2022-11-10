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
	public void selectId() {
		// TODO Auto-generated method stub
		
		sqlSession.selectOne(namespace + "selectMember");
	}

	
	
	
}
