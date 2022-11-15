package com.mealmaker.babiyo.member.model;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDto {

	private String id = "";
	private String password = "";
	private String name = "";
	private String email = "";
	private Date birthDate = null;
	private String gender = "";
	private String phone = "";
	private String nickname = "";
	private int cash = 0;
	private int grade = 0;
	private Date createDate = null;
	private Date modifyDate = null;
	

}
