package com.mealmaker.babiyo.order.model;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDto {

	private int no;
	private String memberId;
	private Date orderDate;
	private int totalPrice;
	private String receiverName;
	private String receiverPhone;
	private String post;
	private String address;
	private String addressDetail;
	private String request;
	private int stateCode;
	
	
}
