package com.mealmaker.babiyo.cart.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mealmaker.babiyo.cart.model.CartDto;
import com.mealmaker.babiyo.cart.service.CartService;
import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.MemberDto;

// 어노테이션 드리븐
@Controller
@SessionAttributes("_memberDto_")
public class CartController {

	private static final Logger logger 
		= LoggerFactory.getLogger(CartController.class);
	
	private final CartService cartService;
	
	@Autowired
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	
	
	@RequestMapping(value = "/cart/cartAdd.do", method = RequestMethod.POST)
	public String cartList(@ModelAttribute("_memberDto_") MemberDto memberDto
			,CartDto cartDto, String backPage ,HttpSession session, Model model) {
		logger.info("장바구니 추가 {} : {}", cartDto.getCartList(), backPage);
		String memberId = memberDto.getId();
		
		cartService.cartAdd(cartDto, memberId);
		
		String url = "";
		
		if(backPage.equals("cart")) {
			url = "redirect:/cart/cartView.do";
		}else if(backPage.equals("favorite")) {
			url = "redirect:/favorite/favoriteView.do";
		}
		
		return url;
	}
	
	
	
	@RequestMapping(value = "/cart/cartView.do", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model) {
		logger.info("장바구니 목록");

		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		String memberId= memberDto.getId();
		
		List<CartDto> list = cartService.cartList(memberId);
		
		model.addAttribute("cartList", list);
		
		return "cart/cartList";
	}
	
	
	@RequestMapping(value="/cart/cartDelete.do", method = RequestMethod.POST)
	public String cartDelete(@ModelAttribute("_memberDto_") MemberDto memberDto,
			CartDto cartDto, HttpSession session, Model model) {
		logger.info("장바구니 삭제 {}" , cartDto.getCartList());
		String memberId = memberDto.getId();
		
		cartService.cartDelete(cartDto, memberId);
		
		return "redirect:/cart/cartView.do";
	}
	
	
	@RequestMapping(value="/cart/cartModify.do", method=RequestMethod.POST)
	@ResponseBody
	public void cartModify(CartDto cartDto, HttpSession session) {
		logger.info("ajax: 장바구니 갯수 수정 {}", cartDto);
		
		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		String memberId = memberDto.getId();
		
		cartDto.setMemberId(memberId);
		
		cartService.quantityModify(cartDto);
	}
	
}
