package com.mealmaker.babiyo.order.dao;

import java.util.List;

import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;

public interface OrderDao {

	public List<OrderDto> selectId();

	public void order(OrderDto orderDto);
	public void orderDetail(List<OrderDetailDto> detailList);

	public OrderDto lastOrder(String memberId);

	public List<OrderDto> orderList(String memberId, int begin, int end);

	public int memberOrderCount(String id);
	
}
