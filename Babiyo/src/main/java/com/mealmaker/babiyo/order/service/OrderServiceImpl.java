package com.mealmaker.babiyo.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.cart.dao.CartDao;
import com.mealmaker.babiyo.cart.model.CartDto;
import com.mealmaker.babiyo.cash.dao.CashDao;
import com.mealmaker.babiyo.order.dao.OrderDao;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

@Service
public class OrderServiceImpl implements OrderService{

	private static final Logger log
		= LoggerFactory.getLogger(OrderServiceImpl.class);
	
	
	private final OrderDao orderDao;
	
	@Resource 
	private CashDao cashDao;
	
	@Resource
	private CartDao cartDao;
	
	@Autowired
	public OrderServiceImpl(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public int order(OrderDto orderDto, OrderDetailDto orderDetailDto) {
		// TODO Auto-generated method stub
		
		orderDao.order(orderDto);
		
		int orderNo = orderDto.getNo();
		
		String memeberId = orderDto.getMemberId();
		orderDetailDto.setOrderNo(orderNo);
		
		orderDao.orderDetail(orderDetailDto);
		
		CartDto cartDto = new CartDto();
		cartDto.setMemberId(memeberId);
		
		List<CartDto> cartList = new ArrayList<CartDto>();
		
		for (OrderDetailDto detail : orderDetailDto.getOrderDetailList()) {
			CartDto cart = new CartDto();
			cart.setProductNo(detail.getProductNo());
			
			cartList.add(cart);
		}
		
		cartDto.setCartList(cartList);
		
		cartDao.cartDelete(cartDto);
		
		cashUpdate(orderDto);
		
		return orderNo;
	}

	@Override
	public OrderDto lastOrder(String memberId) {
		// TODO Auto-generated method stub
		return orderDao.lastOrder(memberId);
	}
	

	@Override
	public Map<String, Object> orderList(String memberId, SearchOption searchOption, int curPage) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		
		int totalCount = orderDao.memberOrderCount(memberId, searchOption);
		
		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<OrderDto> orderList = orderDao.orderList(memberId, begin, end, searchOption);
		
		map.put("orderList", orderList);
		map.put("paging", paging);
		
		return map;
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
	public Map<String, Object> adminOrderList(SearchOption searchOption, int curPage) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCount = orderDao.adminOrderCount(searchOption);
		
		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<OrderDto> orderList = orderDao.adminOrderList(begin, end, searchOption);
		
		map.put("paging", paging);
		map.put("orderList", orderList);
		
		return map;
	}

	@Override
	public void orderAccept(int orderNo) {
		// TODO Auto-generated method stub
		orderDao.orderAccept(orderNo);
	}

	@Override
	public void cashUpdate(OrderDto orderDto) {
		// TODO Auto-generated method stub
		String memberId = orderDto.getMemberId();
		int totalAmount = orderDto.getTotalAmount();
		
		// 유저의 돈을 뺌
		cashDao.cashUpdateOne(memberId, totalAmount * -1);
		
		// 받은돈을 증가시킴
		cashDao.cashUpdateOne("admin", totalAmount);
	}


	

}
