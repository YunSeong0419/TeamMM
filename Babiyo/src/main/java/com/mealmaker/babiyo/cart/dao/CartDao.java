package com.mealmaker.babiyo.cart.dao;

import java.util.List;
import java.util.Map;

import com.mealmaker.babiyo.cart.model.CartDto;

public interface CartDao {

	List<CartDto> cartList(String memberId);

	void quantityModify(CartDto cartDto);

	void cartDelete(CartDto cartDto);

	void cartAdd(Map<String, Object> map);

	List<Integer> cartProductList(String memberId);

	void cartAddModify(Map<String, Object> map);
}
