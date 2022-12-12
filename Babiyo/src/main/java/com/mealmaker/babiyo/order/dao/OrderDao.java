package com.mealmaker.babiyo.order.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface OrderDao {

	public void order(OrderDto orderDto);
	
	public void orderDetail(OrderDetailDto orderDetailDto);

	public OrderDto lastOrder(String memberId);

	public OrderDto orderView(int orderNo);

	List<OrderDetailDto> orderDetailView(int orderNo);

	public void orderCancel(int orderNo);

	public List<Map<String, Object>> orderStateList();

	public void orderAccept(int orderNo);

	public int waitOrderCount();

	public List<Map<String, Object>> salesChart();

	public List<OrderDetailDto> orderDetailList(SearchOption searchOption);

	public Map<String, Object> totalAmountView(int orderNo);

	public List<Map<String, Object>> productChart();

	public int memberTotalOrder(String memberId);

	public int orderCount(Map<String, Object> paraMap);

	public List<OrderDto> orderList(Map<String, Object> paraMap);

	
	
}
