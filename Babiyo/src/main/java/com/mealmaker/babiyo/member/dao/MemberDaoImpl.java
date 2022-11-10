//package com.mealmaker.babiyo.member.dao;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.edu.member.model.MemberDto;
//
//@Repository
//public class MemberDaoImpl implements MemberDao{
//
//	@Autowired
//	SqlSessionTemplate sqlSession;
//	
//	String namespace = "com.edu.member.";
//	
//	@Override
//	public List<MemberDto> memberSelectList(int start, int end, String keyword, String searchOption) {
//		// TODO Auto-generated method stub
//		Map<String, Object> map = new HashMap<>();
//		map.put("start", start);
//		map.put("end", end);
//		map.put("keyword", keyword);
//		map.put("searchOption", searchOption);
//		
//		return sqlSession.selectList(namespace + "memberSelectList", map);
//	}
//
//	@Override
//	public MemberDto memberExist(String email, String password) {
//		// TODO Auto-generated method stub
//		
//		HashMap<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("email", email);
//		paramMap.put("pwd", password);
//		
//		MemberDto memberDto 
//			= sqlSession.selectOne("com.edu.member.memberExist", paramMap);
//		
//		return memberDto;
//	}
//
//	@Override
//	public int memberInsertOne(MemberDto memberDto) {
//		// TODO Auto-generated method stub
//		return sqlSession.insert("com.edu.member.memberInsertOne", memberDto);
//	}
//
//	@Override
//	public MemberDto memberSelectOne(int no) {
//		
//		return sqlSession.selectOne("com.edu.member.memberSelectOne", no);
//	}
//	
//	@Override
//	public int memberUpdateOne(MemberDto memberDto) {
//		
//		return sqlSession.update(namespace + "memberUpdateOne", memberDto);
//	}
//
//	@Override
//	public void memberDeleteOne(int no) {
//		// TODO Auto-generated method stub
//		sqlSession.delete(namespace + "memberDeleteOne", no);
//	}
//
//	@Override
//	public int memberSelectTotalCount(String keyword, String searchOption) {
//		// TODO Auto-generated method stub
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("keyword", keyword);
//		map.put("searchOption", searchOption);
//		
//		return (int)sqlSession.selectOne(namespace + "memberSelectTotalCount", map);
//	}
//
//	@Override
//	public void insertFile(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		
//		sqlSession.insert(namespace + "insertFile", map);
//	}
//
//	@Override
//	public List<Map<String, Object>> fileSelectList(int no) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(namespace + "fileSelectList", no);
//	}
//
//	@Override
//	public Map<String, Object> fileSelectStoredFileName(int parentSeq) {
//		// TODO Auto-generated method stub
//		
//		return sqlSession.selectOne(namespace + "fileSelectStoredFileName"
//			, parentSeq);
//	}
//
//	@Override
//	public int fileDelete(int parentSeq) {
//		// TODO Auto-generated method stub
//		return sqlSession.delete(namespace + "fileDelete", parentSeq);
//	}
//
//}
