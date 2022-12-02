package com.mealmaker.babiyo.notice.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeDto {
	
	private int no;
	private int categoryCode;
	private String categoryName;
	private String title;
	private String content;
	private int hit;
	private Date createDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eventStartDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date eventEndDate;
	
	
}
