package com.mealmaker.babiyo.favorite.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.favorite.model.FavoriteDto;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {

	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.favorite.";
	
	@Autowired
	public FavoriteDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FavoriteDto> favoriteList(String memberId, int begin, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> paraMap = new HashMap<String, Object>();
		
		paraMap.put("memberId", memberId);
		paraMap.put("begin", begin);
		paraMap.put("end", end);
		
		return sqlSession.selectList(namespace + "favoriteList", paraMap);
	}

	@Override
	public void favoriteAdd(FavoriteDto favoriteDto) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "favoriteAdd", favoriteDto);
	}
	
	@Override
	public void favoriteDelete(FavoriteDto favoriteDto) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "favoriteDelete", favoriteDto);
	}
	
	@Override
	public String favoriteCheck(FavoriteDto favoriteDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "favoriteCheck", favoriteDto);
	}

	@Override
	public int totalCount(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "totalCount", memberId);
	}


	
}
