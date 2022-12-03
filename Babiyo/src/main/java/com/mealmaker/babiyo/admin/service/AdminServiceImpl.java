package com.mealmaker.babiyo.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.order.dao.OrderDao;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log 
		= LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public Map<String, Integer> waitCount() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int orderCount = orderDao.waitOrderCount();
//		int inquiryCount = inquiryDao.waitInquiryCount();
		
		map.put("orderCount", orderCount);
//		map.put("inquiryCount", inquiryCount);
		
		return map;
	}

	@Override
	public List<Integer> salesChart() {
		// TODO Auto-generated method stub
		
		return orderDao.salesChart();
	}
	
	
}
