//package com.mealmaker.babiyo.member.dao;
//
//import java.util.List;
//import java.util.Map;
//
//import com.edu.member.model.MemberDto;
//
//public interface MemberDao {
//
//	public MemberDto memberExist(String email, String password);
//	public int memberInsertOne(MemberDto memberDto);
//	public MemberDto memberSelectOne(int no);
//	int memberUpdateOne(MemberDto memberDto);
//	
//	public void memberDeleteOne(int no);
//	public void insertFile(Map<String, Object> map);
//	
//	public List<Map<String, Object>> fileSelectList(int no);
//	public Map<String, Object> fileSelectStoredFileName(int parentSeq);
//	public int fileDelete(int parentSeq);
//	int memberSelectTotalCount(String keyword, String searchOption);
//	List<MemberDto> memberSelectList(int start, int end, String keyword, String searchOption);
//}
