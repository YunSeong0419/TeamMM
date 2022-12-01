package com.mealmaker.babiyo.favorite.dao;

import java.util.List;

import com.mealmaker.babiyo.favorite.model.FavoriteDto;

public interface FavoriteDao {

	List<FavoriteDto> favoriteList(String memberId, int begin, int end);

	void favoriteDelete(FavoriteDto favoriteDto);

	String favoriteCheck(FavoriteDto favoriteDto);

	void favoriteAdd(FavoriteDto favoriteDto);

	int totalCount(String memberId);

}
