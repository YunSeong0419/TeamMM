package com.mealmaker.babiyo.cash.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CashDto {

	private int no = 0;
	private String memberId;
	private int categoryCode = 0;
	private Date histroyDate = null;
	private int amount = 0;
	private int balance = 0;
	
	
	
	
}
