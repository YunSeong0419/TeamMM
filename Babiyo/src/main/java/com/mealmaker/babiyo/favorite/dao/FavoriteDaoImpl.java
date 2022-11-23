package com.mealmaker.babiyo.favorite.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FavoriteDaoImpl implements FavoriteDao {

	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.favorite.";
	
	@Autowired
	public FavoriteDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
