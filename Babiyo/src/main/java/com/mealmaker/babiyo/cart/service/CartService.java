package com.mealmaker.babiyo.cart.service;

import java.util.List;

import com.mealmaker.babiyo.cart.model.CartDto;

public interface CartService {

	List<CartDto> cartList(String memberId);

	void quantityModify(CartDto cartDto);

	void cartDelete(CartDto cartDto, String memberId);

	void cartListAdd(List<Integer> productList, String memberId);

	void cartAdd(int productNo, int quantity, String memberId);

}