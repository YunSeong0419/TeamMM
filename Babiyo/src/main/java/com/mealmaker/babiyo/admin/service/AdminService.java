package com.mealmaker.babiyo.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	public Map<String, Integer> waitCount();

	public List<Integer> salesChart();

	public Map<String, List<Object>> productChart();
	
}
