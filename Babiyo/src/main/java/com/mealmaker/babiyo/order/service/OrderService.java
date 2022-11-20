package com.mealmaker.babiyo.order.service;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;

public interface OrderService {
	
	public List<OrderDto> selectId();

	public int order(OrderDto orderDto, List<OrderDetailDto> detailList);

	public OrderDto lastOrder(String memberId);

	public List<OrderDto> orderList(String memberId, int begin, int end);

	public int memberOrderCount(String id);

	public Map<String, Object> orderView(int orderNo);

	public void orderCancel(int orderNo);
	
}
