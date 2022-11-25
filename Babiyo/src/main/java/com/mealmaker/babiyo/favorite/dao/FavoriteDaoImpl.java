package com.mealmaker.babiyo.favorite.dao;

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
	public List<FavoriteDto> favoriteList(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "favoriteList", memberId);
	}

	@Override
	public void favoriteDelete(FavoriteDto favoriteDto) {
		// TODO Auto-generated method stub
		
		sqlSession.delete(namespace + "favoriteDelete", favoriteDto);
		
	}


	@Override
	public void favoriteAdd(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace + "favoriteAdd", paraMap);
	}
	
}
