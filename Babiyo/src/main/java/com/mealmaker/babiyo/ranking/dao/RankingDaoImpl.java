package com.mealmaker.babiyo.ranking.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.product.model.ProductDto;

@Repository
public class RankingDaoImpl implements RankingDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.mealmaker.babiyo.ranking.";

	@Override
	public List<ProductDto> toDayList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "toDayList");
	}

	@Override
	public List<ProductDto> weeklyList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "weeklyList");
	}

	@Override
	public List<ProductDto> manList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "manList");
	}

	@Override
	public List<ProductDto> womanList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "womanList");
	}


}
