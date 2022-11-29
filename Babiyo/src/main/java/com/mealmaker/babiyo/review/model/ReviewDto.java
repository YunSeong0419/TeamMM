package com.mealmaker.babiyo.review.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDto {

	private int no;
	private int productNo;
	private String productName;
	private String categoryName;
	private String memberId;
	private int starRating;
	private String content;
	private Date createDate;
	private Date modifyDate;
	
}
