package com.mealmaker.babiyo.favorite.service;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.favorite.model.FavoriteDto;

public interface FavoriteService {

	List<Map<String, Object>> favoriteList(String memberId);

	void favoriteDelete(List<FavoriteDto> list);

	void favoriteAdd(FavoriteDto favoriteDto);

}
