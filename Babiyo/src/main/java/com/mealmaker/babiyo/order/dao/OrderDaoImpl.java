package com.mealmaker.babiyo.order.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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
	public List<OrderDto> orderList(String memberId, int begin, int end, SearchOption searchOption) {
		// TODO Auto-generated method stub
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		int stateCode = searchOption.getStateCode();
		
		paraMap.put("id", memberId);
		paraMap.put("begin", begin);
		paraMap.put("end", end);
		paraMap.put("stateCode", stateCode);
		
		return sqlSession.selectList(namespace + "orderList", paraMap);
	}

	@Override
	public int memberOrderCount(String id, SearchOption searchOption) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
		int stateCode = searchOption.getStateCode();
		
		paraMap.put("id", id);
		paraMap.put("stateCode", stateCode);
		
		return sqlSession.selectOne(namespace + "memberOrderCount", paraMap);
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
	public int adminOrderCount(SearchOption searchOption) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "adminOrderCount", searchOption);
	}

	@Override
	public List<OrderDto> adminOrderList(int begin, int end, SearchOption searchOption) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paraMap = new HashMap<String, Object>();
	
		paraMap.put("begin", begin);
		paraMap.put("end", end);
		paraMap.put("beginDate", searchOption.getBeginDate());
		paraMap.put("endDate", searchOption.getEndDate());
		paraMap.put("search", searchOption.getSearch());
		paraMap.put("stateCode", searchOption.getStateCode());
		
		return sqlSession.selectList(namespace + "adminOrderList", paraMap);
	}

	
	
}
