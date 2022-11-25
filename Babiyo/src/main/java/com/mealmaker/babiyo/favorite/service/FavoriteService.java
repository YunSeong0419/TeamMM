package com.mealmaker.babiyo.favorite.service;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.favorite.model.FavoriteDto;

public interface FavoriteService {

	List<Map<String, Object>> favoriteList(String memberId);

	void favoriteDelete(FavoriteDto favoriteDto, String memberId);

	void favoriteAdd(int productNo, String memberId);

}
