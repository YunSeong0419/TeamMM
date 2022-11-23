package com.mealmaker.babiyo.favorite.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.favorite.dao.FavoriteDao;

@Service
public class FavoriteServiceImpl implements FavoriteService{

	private static final Logger log 
		= LoggerFactory.getLogger(FavoriteServiceImpl.class);
	
	private final FavoriteDao favoriteDao;
	
	@Autowired
	public FavoriteServiceImpl(FavoriteDao favoriteDao) {
		this.favoriteDao = favoriteDao;
	}

}
