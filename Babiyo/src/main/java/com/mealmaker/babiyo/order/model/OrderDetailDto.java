package com.mealmaker.babiyo.order.model;

import java.util.List;

import lombok.Data;

@Data
public class OrderDetailDto {

	private int no;
	private int orderNo;
	private int productNo;
	private String productName;
	private int quantity;
	private int price;

	private List<OrderDetailDto> orderDetailList;

}
