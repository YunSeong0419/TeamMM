package com.mealmaker.babiyo.order.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.order.dao.OrderDao;

@Service
public class OrderServiceImpl implements OrderService{

	private static final Logger log 
		= LoggerFactory.getLogger(OrderServiceImpl.class);
	
	@Autowired
	OrderDao orderDao;

	@Override
	public String selectId() {
		// TODO Auto-generated method stub
		
		return orderDao.selectId();
	}
	

}
