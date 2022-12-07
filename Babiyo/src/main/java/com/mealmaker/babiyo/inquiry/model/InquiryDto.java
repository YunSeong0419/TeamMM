package com.mealmaker.babiyo.inquiry.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class InquiryDto {

	private int no;
	private String memberId;
	private int categoryCode;
	private String name;
	private String title;
	private String content;
	private String answer;
	@DateTimeFormat(pattern = "yyyy년MM월dd일")
	private Date createDate;
	private int inquiryNo;
	
}
