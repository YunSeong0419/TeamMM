package com.mealmaker.babiyo.favorite.model;

import java.util.List;

import lombok.Data;

@Data
public class FavoriteDto {

	private int no;
	private String memberId;
	private int productNo;
	private String productName;
	private int productPrice;
	private int quantity;
	
	private List<FavoriteDto> favoriteList;
	
}
