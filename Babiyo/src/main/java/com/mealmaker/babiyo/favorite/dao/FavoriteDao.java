package com.mealmaker.babiyo.favorite.dao;

import java.util.List;

import com.mealmaker.babiyo.favorite.model.FavoriteDto;

public interface FavoriteDao {

	List<FavoriteDto> favoriteList(String memberId);

	void favoriteDelete(List<FavoriteDto> list);

}
