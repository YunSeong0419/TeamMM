package com.mealmaker.babiyo.cart.service;

import java.util.List;

import com.mealmaker.babiyo.cart.model.CartDto;

public interface CartService {

	List<CartDto> cartList(String memberId);

	void cartDelete(List<CartDto> list);

	void quantityModify(CartDto cartDto);
}
