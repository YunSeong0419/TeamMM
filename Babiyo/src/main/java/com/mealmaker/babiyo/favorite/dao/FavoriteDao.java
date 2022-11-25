package com.mealmaker.babiyo.favorite.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.favorite.model.FavoriteDto;

public interface FavoriteDao {

	List<FavoriteDto> favoriteList(String memberId);

	void favoriteDelete(FavoriteDto favoriteDto);

	void favoriteAdd(Map<String, Object> paraMap);

}
