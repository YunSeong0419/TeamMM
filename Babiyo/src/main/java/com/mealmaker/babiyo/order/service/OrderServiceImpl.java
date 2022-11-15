package com.mealmaker.babiyo.order.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.order.dao.OrderDao;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;

@Service
public class OrderServiceImpl implements OrderService{

	private static final Logger log 
		= LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Autowired
	OrderDao orderDao;

	@Override
	public List<OrderDto> selectId() {
		// TODO Auto-generated method stub
		
		return orderDao.selectId();
	}

	@Override
	public void order(OrderDto orderDto, List<OrderDetailDto> detailList) {
		// TODO Auto-generated method stub
		orderDao.order(orderDto);
		
		int orderNo = orderDto.getNo();
		
		for (OrderDetailDto orderDetailDto : detailList) {
			orderDetailDto.setOrderNo(orderNo);;
		}
		orderDao.orderDetail(detailList);
		
	}

	@Override
	public OrderDto lastOrder() {
		// TODO Auto-generated method stub
		return orderDao.lastOrder();
	}
	

}
