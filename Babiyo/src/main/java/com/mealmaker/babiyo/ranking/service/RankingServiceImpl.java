package com.mealmaker.babiyo.ranking.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.ranking.dao.RankingDao;

public class RankingServiceImpl implements RankingService{

	private static final Logger log = LoggerFactory.getLogger(RankingServiceImpl.class);

	@Autowired
	RankingDao rankingDao;

	@Override
	public List<ProductDto> toDayList() {
		// TODO Auto-generated method stub
		return rankingDao.toDayList();
	}

	@Override
	public List<ProductDto> weeklyList() {
		// TODO Auto-generated method stub
		return rankingDao.weeklyList();
	}

	@Override
	public List<ProductDto> manList() {
		// TODO Auto-generated method stub
		return rankingDao.manList();
	}

	@Override
	public List<ProductDto> womanList() {
		// TODO Auto-generated method stub
		return rankingDao.womanList();
	}
	


}
