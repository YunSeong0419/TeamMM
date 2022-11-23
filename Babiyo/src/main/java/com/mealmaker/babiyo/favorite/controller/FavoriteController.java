package com.mealmaker.babiyo.favorite.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mealmaker.babiyo.cart.controller.CartController;
import com.mealmaker.babiyo.cart.service.CartService;
import com.mealmaker.babiyo.member.dao.MemberDao;

public class FavoriteController {

	private static final Logger logger 
	= LoggerFactory.getLogger(CartController.class);

	private final FavoriteController favoriteController;
	
	@Resource
	private MemberDao memberDao;
	
	@Autowired
	public FavoriteController(FavoriteController favoriteController) {
		this.favoriteController = favoriteController;
	}
		
	
	@RequestMapping(value="/favorite/favoriteView.do")
	public String favoritList(Model model) {
		
		
		
		return "favorite/favoriteList";
	}
	
	
}
