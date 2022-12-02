//package com.mealmaker.babiyo.ranking.dao;
//
//import java.util.List;
//
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//
//public class RankingDaoImpl implements RankingDao{
//
//	@Autowired
//	SqlSessionTemplate sqlSession;
//	
//	String namespace = "com.mealmaker.babiyo.ranking.";
//	
//	@Override
//	public List<RankingDao> toDayList() {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(namespace + "toDayList");
//	}
//
//	@Override
//	public List<RankingDao> weeklyList() {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(namespace + "weeklyList");
//	}
//
//	@Override
//	public List<RankingDao> manList() {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(namespace + "manList");
//	}
//
//	@Override
//	public List<RankingDao> womanList() {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList(namespace + "womanList");
//	}
//
//
//}
