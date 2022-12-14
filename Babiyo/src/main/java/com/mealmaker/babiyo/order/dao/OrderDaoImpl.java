package com.mealmaker.babiyo.order.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.util.SearchOption;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.mealmaker.babiyo.order.";
	

	@Override
	public void order(OrderDto orderDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "order", orderDto);
	}


	@Override
	public void orderDetail(OrderDetailDto orderDetailDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "orderDetail", orderDetailDto);
	}

	@Override
	public OrderDto lastOrder(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "lastOrder", memberId);
	}


	@Override
	public int orderCount(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "orderCount", paraMap);
	}
	
	@Override
	public List<OrderDto> orderList(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "orderList", paraMap);
	}
	

	@Override
	public OrderDto orderView(int orderNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "orderView", orderNo);
	}

	@Override
	public List<OrderDetailDto> orderDetailView(int orderNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "orderDetailView", orderNo);
	}

	@Override
	public void orderCancel(int orderNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "orderCancel", orderNo);
	}

	@Override
	public List<Map<String, Object>> orderStateList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "orderStateList");
	}

	@Override
	public void orderAccept(int orderNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "orderAccept", orderNo);
	}


	@Override
	public int waitOrderCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "waitOrderCount");
	}




	@Override
	public List<OrderDetailDto> orderDetailList(SearchOption searchOption) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "orderDetailList" , searchOption);
	}


	@Override
	public Map<String, Object> totalAmountView(int orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "totalAmountView", orderNo);
	}
	
	@Override
	public List<Map<String, Object>> salesChart() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "salesChart");
	}

	@Override
	public List<Map<String, Object>> productChart() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "productChart");
	}
	
	@Override
	public int memberTotalOrder(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberHomeOrderCount", memberId);
	}

}
