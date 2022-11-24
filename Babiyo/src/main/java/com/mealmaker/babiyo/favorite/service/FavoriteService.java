package com.mealmaker.babiyo.favorite.service;

import java.util.List;
import java.util.Map;

public interface FavoriteService {

	List<Map<String, Object>> favoriteList(String memberId);

}
