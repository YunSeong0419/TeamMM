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

	public List<OrderDto> orderList(String memberId, int begin, int end, SearchOption searchOption);

	public int memberOrderCount(String id, SearchOption searchOption);

	public OrderDto orderView(int orderNo);

	List<OrderDetailDto> orderDetailView(int orderNo);

	public void orderCancel(int orderNo);

	public List<Map<String, Object>> orderStateList();

	public int adminOrderCount(SearchOption searchOption);

	public List<OrderDto> adminOrderList(int begin, int end, SearchOption searchOption);

	public void orderAccept(int orderNo);

	public int waitOrderCount();

	public List<Integer> salesChart();

	public List<OrderDetailDto> orderDetailList(SearchOption searchOption);
	
}
