package com.mealmaker.babiyo.inquiry.model;

import java.util.Date;

import lombok.Data;

@Data
public class InquiryDto {

	private int no;
	private String memberId;
	private int categoryCode;
	private String title;
	private String content;
	private String answer;
	private Date createDate;
	private int code;
	private String name;
}
