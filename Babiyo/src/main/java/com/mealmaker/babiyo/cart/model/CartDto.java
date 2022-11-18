package com.mealmaker.babiyo.cart.model;

import java.util.List;

import lombok.Data;

@Data
public class CartDto {

	private int no;
	private String memberId;
	private int productNo;
	private String productName;
	private int productPrice;
	private int quantity;
	
	private List<CartDto> cartList;
	
}
