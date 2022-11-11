package com.mealmaker.babiyo.order.model;

import lombok.Data;

@Data
public class OrderDetailDto {

	private int no;
	private int orderNo;
	private int productNo;
	private int amount;
	private int price;
	
}
