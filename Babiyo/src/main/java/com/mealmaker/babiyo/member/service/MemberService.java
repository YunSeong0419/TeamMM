//package com.mealmaker.babiyo.member.service;
//
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//
//import com.edu.member.model.MemberDto;
//
//public interface MemberService {
//
//	public MemberDto memberExist(String email, String password);
//
//	public void memberInsertOne(MemberDto memberDto, MultipartHttpServletRequest mulRequest) throws Exception;
//
//	public Map<String, Object> memberSelectOne(int no);
//
//	public int memberUpdateOne(MemberDto memberDto, MultipartHttpServletRequest multipartHttpServletRequest,
//			int fileIdx) throws Exception;
//
//	public void memberDeleteOne(int no);
//
//	int memberSelectTotalCount(String keyword, String searchOption);
//
//	List<MemberDto> memberSelectList(int start, int end, String keyword, String searchOption);
//}
