package com.mealmaker.babiyo.cart.dao;

import java.util.List;

import com.mealmaker.babiyo.cart.model.CartDto;

public interface CartDao {

	List<CartDto> cartList(String memberId);

	void quantityModify(CartDto cartDto);

	void cartDelete(List<CartDto> list);
}
