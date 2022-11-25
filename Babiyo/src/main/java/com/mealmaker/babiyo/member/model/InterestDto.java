package com.mealmaker.babiyo.member.model;

import java.util.List;

import lombok.Data;

@Data
public class InterestDto {

	private String memberId;
	private String listNo;
	private int categoryCode;
	
	private List<InterestDto> interestList;
	
}
