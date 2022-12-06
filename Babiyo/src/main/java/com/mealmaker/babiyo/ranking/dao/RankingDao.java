package com.mealmaker.babiyo.ranking.dao;

import java.util.List;

import com.mealmaker.babiyo.product.model.ProductDto;

public interface RankingDao {

	public List<ProductDto> toDayList();
	public List<ProductDto> weeklyList();
	public List<ProductDto> manList();
	public List<ProductDto> womanList();
		
}
