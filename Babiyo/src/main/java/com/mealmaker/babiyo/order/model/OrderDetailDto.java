package com.mealmaker.babiyo.order.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDetailDto {

	private int no;
	private int orderNo;
	private Date orderDate;
	private String memberId;
	private int productNo;
	private String productName;
	private int quantity;
	private int price;

	private List<OrderDetailDto> orderDetailList;

}
