package com.mealmaker.babiyo.review.model;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class ReviewDto {

	private int no;
	private int productNo;
	private String productName;
	private String categoryName;
	private String memberId;
	private double starRating;
	private String content;
	private Date createDate;
	private Date modifyDate;
	
}
