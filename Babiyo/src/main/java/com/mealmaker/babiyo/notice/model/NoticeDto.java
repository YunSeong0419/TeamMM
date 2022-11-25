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
	@DateTimeFormat(pattern = "yyyy년MM월dd일")
	private Date createDate;
	@DateTimeFormat(pattern = "yyyy년MM월dd일")
	private Date eventStartDate;
	@DateTimeFormat(pattern = "yyyy년MM월dd일")
	private Date eventEndDate;
}
