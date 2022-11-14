package com.mealmaker.babiyo.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.order.model.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.mealmaker.babiyo.order.";
	
	@Override
	public List<OrderDto> selectId() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "selectMember");
	}

	@Override
	public void order(OrderDto orderDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "order", orderDto);
	}

	
	
	
}
