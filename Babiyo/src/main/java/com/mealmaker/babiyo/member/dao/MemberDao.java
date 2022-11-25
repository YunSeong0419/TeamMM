package com.mealmaker.babiyo.member.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.member.model.InterestDto;
import com.mealmaker.babiyo.member.model.MemberDto;

public interface MemberDao {

	public List<MemberDto> memberSelectList(String searchOption, 
		String keyword,	int start, int end);
	public MemberDto memberExist(String id, String password);
	public int memberInsertOne(MemberDto memberDto);
	public MemberDto memberSelectOne(int no);
	int memberUpdateOne(MemberDto memberDto);
	
	public void memberDeleteOne(int no);
	public int memberSelectTotalCount(String searchOption, String keyword);
	public void insertFile(Map<String, Object> map);
	
	public List<Map<String, Object>> fileSelectList(int no);
	public Map<String, Object> fileSelectStoredFileName(String parentSeq);
	public int fileDelete(String parentSeq);
	public void addInterest(InterestDto interestDto);
	
}
