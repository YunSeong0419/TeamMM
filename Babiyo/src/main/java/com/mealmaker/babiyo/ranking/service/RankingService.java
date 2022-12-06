package com.mealmaker.babiyo.ranking.service;

import java.util.List;

import com.mealmaker.babiyo.product.model.ProductDto;

public interface RankingService {
	
	public List<ProductDto> toDayList();
	public List<ProductDto> weeklyList();
	public List<ProductDto> manList();
	public List<ProductDto> womanList();
	
}
