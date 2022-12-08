package com.mealmaker.babiyo.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.member.model.InterestDto;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.util.SearchOption;

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
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		System.out.println(id);
		return	sqlSession.selectOne(namespace + "idCheck", id);
		
	}
	
	
	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		System.out.println(email);
		return	sqlSession.selectOne(namespace + "emailCheck", email);
		
	}
	
	@Override
	public int phoneCheck(String phone) {
		// TODO Auto-generated method stub
		System.out.println(phone);
		return	sqlSession.selectOne(namespace + "phoneCheck", phone);
		
	}
	
	@Override
	public int nicknameCheck(String nickname) {
		// TODO Auto-generated method stub
		System.out.println(nickname);
		return	sqlSession.selectOne(namespace + "nicknameCheck", nickname);
		
	}

	@Override
	public int memberInsertOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "memberInsertOne"
			, memberDto);
	}
	
	@Override
	public List<Map<String, Object>> categoryCodeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "categoryCodeList");
	}
	
	@Override
	public void addInterest(InterestDto interestDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "insertInterest"
				, interestDto);
	}

	@Override
	public MemberDto memberInfo(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberInfo"
				, memberDto);
	}

	@Override
	public void memberUpdateOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "memberUpdateOne"
				, memberDto);
	}

	@Override
	public void UpdateInterest(InterestDto interestDto) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "UpdateInterest"
				, interestDto);
	}

	@Override
	public List<Map<String, Object>> memberInterest(InterestDto interestDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "memberInterest");
	}

	@Override
	public List<Map<String, Object>> selectInterest(String memberId) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList(namespace + "memberInterest", memberId);
	}

	@Override
	public void memberDeleteOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "memberDeleteOne", memberDto);
	}

	@Override
	public MemberDto findId(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "findId", email);
	}
	
	@Override
	public MemberDto findPwd(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "findPwd", email);
	}

	@Override
	public void newPwd(MemberDto memberDto) {
		// TODO Auto-generated method stub
		System.out.println(memberDto);
		sqlSession.update(namespace + "newPwd", memberDto);
	}

	@Override
	public int memberCount(SearchOption searchOption) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberCount", searchOption);
	}

	@Override
	public List<MemberDto> memberList(int begin, int end, SearchOption searchOption, int curPage) {
		// TODO Auto-generated method stub
Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("begin", begin);
		paraMap.put("end", end);
		paraMap.put("curPage", curPage);
		paraMap.put("search", searchOption.getSearch());
		paraMap.put("searchOption", searchOption.getSearchOption());
		paraMap.put("stateCode", searchOption.getStateCode());
		
		return sqlSession.selectList(namespace + "memberList", paraMap);
	}
	


	

	



	
	
	



	
	


	

	

}
