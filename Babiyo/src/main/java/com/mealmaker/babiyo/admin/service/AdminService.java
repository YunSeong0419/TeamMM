package com.mealmaker.babiyo.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	public Map<String, Integer> waitCount();

	public Map<String, List<Object>> salesChart();

	public Map<String, List<Object>> productChart();
	
}
