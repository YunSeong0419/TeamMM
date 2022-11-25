package com.mealmaker.babiyo.favorite.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mealmaker.babiyo.cart.controller.CartController;
import com.mealmaker.babiyo.cart.model.CartDto;
import com.mealmaker.babiyo.favorite.model.FavoriteDto;
import com.mealmaker.babiyo.favorite.service.FavoriteService;
import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.MemberDto;

@Controller
@SessionAttributes("_memberDto_")
public class FavoriteController {

	private static final Logger logger 
	= LoggerFactory.getLogger(CartController.class);

	private final FavoriteService favoriteService;
	
	
	@Autowired
	public FavoriteController(FavoriteService favoriteService) {
		this.favoriteService = favoriteService;
	}
	
	@RequestMapping(value = "/favorite/favoriteAdd.do", method = RequestMethod.POST)
	public String cartList(int productNo, @ModelAttribute("_memberDto_")MemberDto memberDto 
			,HttpSession session, Model model) {
		logger.info("즐겨찾기 추가 {}", productNo);
		String memberId = memberDto.getId();
		
		favoriteService.favoriteAdd(productNo, memberId);
		
		return "redirect:/product/detail.do";
	}
	
	@RequestMapping(value="/favorite/favoriteView.do", method = RequestMethod.GET)
	public String favoritList(@ModelAttribute("_memberDto_")MemberDto memberDto,
			HttpSession session , Model model) {
		String memberId = memberDto.getId();
		
		List<Map<String, Object>> favoriteList = favoriteService.favoriteList(memberId);
		
		model.addAttribute("favoriteList", favoriteList);
		
		return "favorite/favoriteList";
	}
	
	@RequestMapping(value="/favorite/favoriteDelete.do", method = RequestMethod.POST)
	public String favoritDelete(@ModelAttribute("_memberDto_")MemberDto memberDto
			, FavoriteDto favoriteDto, Model model) {
		String memberId = memberDto.getId();

		favoriteService.favoriteDelete(favoriteDto, memberId);
		
		return "redirect:/favorite/favoriteView.do";
	}
	
}
