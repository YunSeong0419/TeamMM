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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	

	@RequestMapping(value="/favorite/favoriteView.do", method = RequestMethod.GET)
	public String favoritList(@ModelAttribute("_memberDto_")MemberDto memberDto,
			HttpSession session , Model model) {
		logger.info("즐겨찾기 목록 보기 {}", memberDto);
		String memberId = memberDto.getId();
		
		List<Map<String, Object>> favoriteList = favoriteService.favoriteList(memberId);
		
		model.addAttribute("favoriteList", favoriteList);
		
		return "favorite/favoriteList";
	}
	
	@RequestMapping(value="/favorite/favoriteDelete.do", method = RequestMethod.POST)
	public String favoritDelete(@ModelAttribute("_memberDto_")MemberDto memberDto
			, FavoriteDto favoriteDto, Model model) {
		logger.info("즐겨찾기 제거 {}", favoriteDto);
		String memberId = memberDto.getId();

		favoriteService.favoriteDelete(favoriteDto, memberId);
		
		return "redirect:/favorite/favoriteView.do";
	}
	
	@RequestMapping(value="/favorite/favoriteBtn.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean favoritBtn(@ModelAttribute("_memberDto_")MemberDto memberDto
			,@RequestParam(value="productNo") int productNo, Model model) {
		logger.info("ajax: 즐겨찾기 추가또는 제거버튼 제품번호 : {}", productNo);
		
		String memberId = memberDto.getId();
		
		// 삭제가 됬으면 true 추가됬으면 false
		return favoriteService.favoriteBtn(memberId, productNo);
	}
	
}
