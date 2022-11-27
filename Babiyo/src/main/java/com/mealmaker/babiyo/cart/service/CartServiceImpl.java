package com.mealmaker.babiyo.cart.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.cart.dao.CartDao;
import com.mealmaker.babiyo.cart.model.CartDto;

@Service
public class CartServiceImpl implements CartService{

	private static final Logger log 
		= LoggerFactory.getLogger(CartServiceImpl.class);
	
	private final CartDao cartDao;
	
	@Autowired
	public CartServiceImpl(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public List<CartDto> cartList(String memberId) {
		// TODO Auto-generated method stub
		return cartDao.cartList(memberId);
	}


	@Override
	public void quantityModify(CartDto cartDto) {
		// TODO Auto-generated method stub
		cartDao.quantityModify(cartDto);
	}

	@Override
	public void cartAdd(CartDto cartDto, String memberId) {
		// TODO Auto-generated method stub
		
		cartDto.setMemberId(memberId);
		
		cartDao.cartAdd(cartDto);
	}

	@Override
	public void cartDelete(CartDto cartDto, String memberId) {
		// TODO Auto-generated method stub
		cartDto.setMemberId(memberId);
		
		cartDao.cartDelete(cartDto);
	}

	
	@Override
	public boolean cartDoubleCheck(List<Integer> productList, String memeberId) {
		// TODO Auto-generated method stub
		List<CartDto> cartList = cartDao.cartList(memeberId);
		
		for (CartDto cartDto : cartList) {
			int productNo = cartDto.getProductNo();
			
			boolean doubleCheck = productList.contains(productNo);
			
			if(doubleCheck) {
				return false;
			}
		}
		
		return true;
	}
	

}
