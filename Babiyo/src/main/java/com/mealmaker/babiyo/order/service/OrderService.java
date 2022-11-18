package com.mealmaker.babiyo.order.service;

import java.util.List;

import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;

public interface OrderService {
	
	public List<OrderDto> selectId();

	public int order(OrderDto orderDto, List<OrderDetailDto> detailList);

	public OrderDto lastOrder(String memberId);

	public List<OrderDto> orderList(MemberDto memberDto);
	
}
