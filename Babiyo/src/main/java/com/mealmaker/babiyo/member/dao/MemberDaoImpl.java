package com.mealmaker.babiyo.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.member.model.InterestDto;
import com.mealmaker.babiyo.member.model.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.member.";
	
//	@Override
//	public List<MemberDto> memberSelectList(String searchOption
//		, String keyword, int start, int end) {
//		// TODO Auto-generated method stub
//		Map<String, Object> map = new HashMap<>();
//		
//		map.put("searchOption", searchOption);
//		map.put("keyword", keyword);
//		map.put("start", start);
//		map.put("end", end);
//		
//		return sqlSession.selectList(namespace + "memberSelectList"
//			, map);
//	}

	@Override
	public MemberDto memberExist(String id, String password) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("id", id);
		paramMap.put("password", password);
		
		MemberDto memberDto 
			= sqlSession.selectOne(namespace + "memberExist", paramMap);
		
		return memberDto;
	}

	@Override
	public int memberInsertOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "memberInsertOne"
			, memberDto);
	}
	
	

	@Override
	public MemberDto memberSelectOne(int no) {
		
		return sqlSession.selectOne(namespace + "memberSelectOne"
			, no);
	}
	
	@Override
	public int memberUpdateOne(MemberDto memberDto) {
		
		return sqlSession.update(namespace + "memberUpdateOne", memberDto);
	}

	@Override
	public void memberDeleteOne(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "memberDeleteOne", no);
	}

	@Override
	public int memberSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(
			namespace + "memberSelectTotalCount", map);
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + "insertFile", map);
	}

	@Override
	public List<Map<String, Object>> fileSelectList(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "fileSelectList", no);
	}

	

	@Override
	public Map<String, Object> fileSelectStoredFileName(String parentSeq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int fileDelete(String parentSeq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberDto> memberSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addInterest(InterestDto interestDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "insertInterest"
				, interestDto);
	}


	

	

}
