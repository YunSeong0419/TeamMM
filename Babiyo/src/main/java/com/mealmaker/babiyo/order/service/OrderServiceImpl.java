package com.mealmaker.babiyo.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.order.dao.OrderDao;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.util.SearchOption;

@Service
public class OrderServiceImpl implements OrderService{

	private static final Logger log 
		= LoggerFactory.getLogger(OrderServiceImpl.class);
	
	
	private final OrderDao orderDao;
	
	@Autowired
	public OrderServiceImpl(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public List<OrderDto> selectId() {
		// TODO Auto-generated method stub
		
		return orderDao.selectId();
	}

	@Override
	public int order(OrderDto orderDto, List<OrderDetailDto> detailList) {
		// TODO Auto-generated method stub
		orderDao.order(orderDto);
		
		int orderNo = orderDto.getNo();
		
		for (OrderDetailDto orderDetailDto : detailList) {
			orderDetailDto.setOrderNo(orderNo);;
		}
		
		orderDao.orderDetail(detailList);
		
		return orderNo;
	}

	@Override
	public OrderDto lastOrder(String memberId) {
		// TODO Auto-generated method stub
		return orderDao.lastOrder(memberId);
	}
	

	@Override
	public List<OrderDto> orderList(String memberId, int begin, int end, SearchOption searchOption) {
		// TODO Auto-generated method stub
		
		return orderDao.orderList(memberId, begin, end, searchOption);
	}

	@Override
	public int memberOrderCount(String id, SearchOption searchOption) {
		// TODO Auto-generated method stub
		return orderDao.memberOrderCount(id, searchOption);
	}

	@Override
	public Map<String, Object> orderView(int orderNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		OrderDto orderDto = orderDao.orderView(orderNo);
		List<OrderDetailDto> orderDetailList = orderDao.orderDetailView(orderNo);
		
		map.put("orderDto", orderDto);
		map.put("orderDetailList", orderDetailList);
		
		return map;
	}

	@Override
	public void orderCancel(int orderNo) {
		// TODO Auto-generated method stub
		
		orderDao.orderCancel(orderNo);
	}

	@Override
	public List<Map<String, Object>> orderStateList() {
		// TODO Auto-generated method stub
		return orderDao.orderStateList();
	}

	@Override
	public int adminOrderCount(SearchOption searchOption) {
		// TODO Auto-generated method stub
		return orderDao.adminOrderCount(searchOption);
	}

	@Override
	public List<OrderDto> adminOrderList(int begin, int end, SearchOption searchOption) {
		// TODO Auto-generated method stub
		return orderDao.adminOrderList(begin, end, searchOption);
	}

	@Override
	public void orderAccept(int orderNo) {
		// TODO Auto-generated method stub
		orderDao.orderAccept(orderNo);
	}
	

}
