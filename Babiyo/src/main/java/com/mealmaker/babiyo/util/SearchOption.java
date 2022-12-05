package com.mealmaker.babiyo.util;

import java.util.Calendar;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchOption {
	
	private String searchOption;
	private String search;
	private String sort;
	private int stateCode;
	private int categoryCode;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date beginDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	
	public SearchOption() {
		this.searchOption = "";
		this.search = "";
		this.sort = "";
		
		setDate();
	}
	
	public void setDate() {
		Date today = new Date();
		
		if(this.beginDate == null) {
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(today);
			cal.add(Calendar.MONTH, -1);
			
			Date beforeMonth = cal.getTime();
			
			this.beginDate = beforeMonth;
			this.endDate = today;
		}
	}
	
}
