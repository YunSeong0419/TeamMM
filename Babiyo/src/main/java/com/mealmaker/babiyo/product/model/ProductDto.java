package com.mealmaker.babiyo.product.model;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDto {

	private int no;
	private int categoryCode;
	private String categoryName;
	private String name;
	private int price;
	private int stock;
	private String content;
	private Date registrationDate;
	
}
