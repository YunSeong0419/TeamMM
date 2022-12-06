package com.mealmaker.babiyo.member.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.member.model.InterestDto;
import com.mealmaker.babiyo.member.model.MemberDto;

public interface MemberDao {

	public MemberDto memberExist(String id, String password);
	public int idCheck(String id);
	public int emailCheck(String email);
	public int phoneCheck(String phone);
	public int nicknameCheck(String nickname);
	public int memberInsertOne(MemberDto memberDto);
	public List<Map<String, Object>> categoryCodeList();
	public void addInterest(InterestDto interestDto);
	public MemberDto memberInfo(MemberDto memberDto);
	public void memberUpdateOne(MemberDto memberDto);
	public void UpdateInterest(InterestDto interestDto);
	public List<Map<String, Object>> memberInterest(InterestDto interestDto);
	List<Map<String, Object>> selectInterest(String memberId);
	public void memberDeleteOne(MemberDto memberDto);
	public MemberDto findId(String email);
	public MemberDto findPwd(String email);
	public void newPwd(MemberDto memberDto);
	
	
	
	
	
	
	
	
	
}
