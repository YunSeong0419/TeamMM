package com.mealmaker.babiyo.order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
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


	@Override
	public void orderDetail(List<OrderDetailDto> detailList) {
		// TODO Auto-generated method stub
		
		for (OrderDetailDto orderDetailDto : detailList) {
			sqlSession.insert(namespace + "orderDetail", orderDetailDto);
		}
	
	}

	@Override
	public OrderDto lastOrder(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "lastOrder", memberId);
	}

	@Override
	public List<OrderDto> orderList(String memberId, int begin, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("id", memberId);
		paramMap.put("begin", begin);
		paramMap.put("end", end);
		
		return sqlSession.selectList(namespace + "orderList", paramMap);
	}

	@Override
	public int memberOrderCount(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberOrderCount", id);
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

	
	
}
