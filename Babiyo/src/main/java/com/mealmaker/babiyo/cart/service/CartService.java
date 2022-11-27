package com.mealmaker.babiyo.cart.service;

import java.util.List;

import com.mealmaker.babiyo.cart.model.CartDto;

public interface CartService {

	List<CartDto> cartList(String memberId);

	void quantityModify(CartDto cartDto);

	void cartAdd(CartDto cartDto, String memberId);

	void cartDelete(CartDto cartDto, String memberId);

	boolean cartDoubleCheck(List<Integer> productList, String memeberId);
}
