package com.mealmaker.babiyo.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.inquiry.dao.InquiryDao;
import com.mealmaker.babiyo.order.dao.OrderDao;

@Service
public class AdminServiceImpl implements AdminService {

	private static final Logger log 
		= LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private OrderDao orderDao;
	
	@Resource
	private InquiryDao inquiryDao;
	
	@Override
	public Map<String, Integer> waitCount() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int orderCount = orderDao.waitOrderCount();
		int inquiryCount = inquiryDao.waitInquiryCount();
		
		map.put("orderCount", orderCount);
		map.put("inquiryCount", inquiryCount);
		
		return map;
	}

	@Override
	public Map<String, List<Object>> salesChart() {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> list = orderDao.salesChart();
		
		Map<String, List<Object>> resultMap = new HashMap<>();
		
		List<Object> weekList = new ArrayList<>();
		List<Object> amountList = new ArrayList<>();
		
		for (Map<String, Object> map : list) {
			weekList.add(map.get("WEEK"));
			amountList.add(map.get("TOTAL_AMOUNT"));
		}
		
		resultMap.put("weekList", weekList);
		resultMap.put("amountList", amountList);
		
		
		return resultMap;
	}

	@Override
	public Map<String, List<Object>> productChart() {
		// TODO Auto-generated method stub
		
		List<Map<String, Object>> list = orderDao.productChart();
		
		Map<String, List<Object>> resultMap = new HashMap<>();
		
		List<Object> nameList = new ArrayList<>();
		List<Object> countList = new ArrayList<>();
		
		for (Map<String, Object> map : list) {
			nameList.add(map.get("NAME"));
			countList.add(map.get("COUNT"));
		}
		
		resultMap.put("nameList", nameList);
		resultMap.put("countList", countList);
		
		return resultMap;
	}
	
	
}
