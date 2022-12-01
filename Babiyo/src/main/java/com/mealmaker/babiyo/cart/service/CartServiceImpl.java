package com.mealmaker.babiyo.cart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.cart.dao.CartDao;
import com.mealmaker.babiyo.cart.model.CartDto;
import com.mealmaker.babiyo.favorite.model.FavoriteDto;
import com.mealmaker.babiyo.product.dao.ProductDao;

@Service
public class CartServiceImpl implements CartService{

	private static final Logger log 
		= LoggerFactory.getLogger(CartServiceImpl.class);
	
	private final CartDao cartDao;
	
	@Resource
	private ProductDao productDao;
	
	@Autowired
	public CartServiceImpl(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public List<Map<String, Object>> cartList(String memberId) {
		// TODO Auto-generated method stub
		
		List<CartDto> cartList = cartDao.cartList(memberId);
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		for (CartDto cartDto : cartList) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int no = cartDto.getProductNo();
			
			Map<String, Object> imgMap = productDao.fileSelectOne(no);
				
			map.put("cartDto", cartDto);
			map.put("imgMap", imgMap);
				
			list.add(map);
		}
		
		return list;
	}


	@Override
	public void quantityModify(CartDto cartDto) {
		// TODO Auto-generated method stub
		cartDao.quantityModify(cartDto);
	}

	@Override
	public void cartListAdd(List<Integer> productList, String memberId) {
		// TODO Auto-generated method stub
		
		List<Integer> cartList = cartDao.cartProductList(memberId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberId", memberId);
		map.put("quantity", 1);
		
		for (int productNo : productList) {
			
			map.put("productNo", productNo);
			
			boolean doubleCheck = cartList.contains(productNo);
			
			if(doubleCheck) {
				cartDao.cartAddModify(map);
			}else {
				cartDao.cartAdd(map);
			}
		}
	}
	
	@Override
	public void cartAdd(int productNo, int quantity, String memberId) {
		// TODO Auto-generated method stub
		
		List<Integer> cartList = cartDao.cartProductList(memberId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberId", memberId);
		map.put("quantity", quantity);
		map.put("productNo", productNo);
		
		boolean doubleCheck = cartList.contains(productNo);
		
		if(doubleCheck) {
			cartDao.cartAddModify(map);
		}else {
			cartDao.cartAdd(map);
		}
		
	}

	@Override
	public void cartDelete(CartDto cartDto, String memberId) {
		// TODO Auto-generated method stub
		cartDto.setMemberId(memberId);
		
		cartDao.cartDelete(cartDto);
	}


}
