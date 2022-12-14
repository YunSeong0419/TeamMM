package com.mealmaker.babiyo.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.member.model.InterestDto;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.util.SearchOption;

public interface MemberService {

	public MemberDto memberExist(String id, String password);
	public int idCheck(String id);
	public int emailCheck(String email);
	public int phoneCheck(String phone);
	public int nicknameCheck(String nickname);
	public void memberInsertOne(MemberDto memberDto);
	public List<Map<String, Object>> categoryCodeList();
	void addInterest(InterestDto interestDto);
	public MemberDto memberInfo(MemberDto memberDto);
	public void memberUpdateOne(MemberDto memberDto);
	public void UpdateInterest(InterestDto interestDto);
	public List<Map<String, Object>> memberInterest(InterestDto interestDto);
	List<Map<String, Object>> selectInterest(String memberId);
	public void memberDeleteOne(MemberDto memberDto);
	public MemberDto findId(String email);
	public MemberDto findPwd(String email);
	public void newPwd(MemberDto memberDto);
	//회원 문의 건수
	public Map<String, Integer> memberListCount(String id);
	//회원 목록
	public Map<String, Object> memberList(SearchOption searchOption, int curPage);
	
	
	
	
	
	

	

	
	
//	public Map<String, Object> memberSelectOne(int no);
//	
//	public int memberUpdateOne(MemberDto memberDto
//		, MultipartHttpServletRequest multipartHttpServletRequest
//		, int fileIdx) throws Exception;
//	
//	public void memberDeleteOne(int no);
//	public int memberSelectTotalCount(String searchOption, String keyword);
	
}
