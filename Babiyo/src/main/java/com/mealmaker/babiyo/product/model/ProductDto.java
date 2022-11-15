package com.mealmaker.babiyo.product.model;

import lombok.Data;

@Data
public class ProductDto {

	private int no;
	private int categoryCode;
	private String name;
	private int price;
	private int stock;
	private String content;
	
}
