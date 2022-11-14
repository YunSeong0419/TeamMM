package com.mealmaker.babiyo.member.model;

import java.util.Date;

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
	
	
	public MemberDto() {
		super();
	}

	public MemberDto( int cash, int grade, String name, String email, String nickname
			, String password, String phone, String gender, String id
			, Date createDate, Date modifyDate, Date birthDate) {
		super();
		this.cash = cash;
		this.grade = grade;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.gender = gender;
		this.nickname = nickname;
		this.id = id;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.birthDate = birthDate;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	
	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", birthDate="
				+ birthDate + ", gender=" + gender + ", phone=" + phone + ", nickname=" + nickname + ", cash=" + cash
				+ ", grade=" + grade + ", createDate=" + createDate + ", modifyDate=" + modifyDate + "]";
	}

}
