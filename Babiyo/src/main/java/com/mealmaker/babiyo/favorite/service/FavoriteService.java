package com.mealmaker.babiyo.favorite.service;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.favorite.model.FavoriteDto;

public interface FavoriteService {


	void favoriteDelete(FavoriteDto favoriteDto, String memberId);

	boolean favoriteBtn(String memberId, int productNo);

	int totalCount(String memberId);

	List<Map<String, Object>> favoriteList(String memberId, int begin, int end);

}
