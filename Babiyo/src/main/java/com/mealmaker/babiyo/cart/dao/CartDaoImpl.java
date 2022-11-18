package com.mealmaker.babiyo.cart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mealmaker.babiyo.cart.model.CartDto;

@Repository
public class CartDaoImpl implements CartDao {

	SqlSessionTemplate sqlSession;
	String namespace = "com.mealmaker.babiyo.cart.";
	
	@Autowired
	public CartDaoImpl(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CartDto> cartList(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "cartList", memberId);
	}

	@Override
	public void cartDelete(List<CartDto> list) {
		// TODO Auto-generated method stub
		for (CartDto cartDto : list) {
			sqlSession.delete(namespace + "cartDelete", cartDto.getNo());
		}
	}

	
}
