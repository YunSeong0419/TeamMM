package com.mealmaker.babiyo.order.service;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface OrderService {

	public int order(OrderDto orderDto, OrderDetailDto orderDetailDto);

	public OrderDto lastOrder(String memberId);

	public Map<String, Object> orderList(String memberId, SearchOption searchOption, int curPage);

	public Map<String, Object> orderView(int orderNo);

	public void orderCancel(int orderNo);

	public List<Map<String, Object>> orderStateList();

	public Map<String, Object> adminOrderList(SearchOption searchOption, int curPage);

	public void orderAccept(int orderNo);
	
	public void cashUpdate(OrderDto orderDto);

	public List<OrderDetailDto> salesView(SearchOption searchOption);

}
