package com.mealmaker.babiyo.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mealmaker.babiyo.cart.model.CartDto;
import com.mealmaker.babiyo.cart.service.CartService;
import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.MemberDto;

import javafx.beans.DefaultProperty;

// 어노테이션 드리븐
@Controller
public class CartController {

	private static final Logger logger 
		= LoggerFactory.getLogger(CartController.class);
	
	private final CartService cartService;
	
	@Resource
	private MemberDao memberDao;
	
	@Autowired
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	
	@RequestMapping(value = "/cart/list.do", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model) {
		logger.info("Welcome CartController cartList! ");

		MemberDto memberDto = memberDao.memberExist("dong", "123");
		session.setAttribute("_memberDto_", memberDto);
		
		String memberId= memberDto.getId();
		
		List<CartDto> list = cartService.cartList(memberId);
		
		model.addAttribute("cartList", list);
		
		return "cart/cartList";
	}
	
	
	@RequestMapping(value="/cart/delete.do", method = RequestMethod.POST)
	public String cartDelete(CartDto cartDto, HttpSession session, Model model) {
		logger.info("Welcome CartController cartDelete! cartList {}" , cartDto.getCartList());
	
		List<Integer> list = new ArrayList<Integer>();
		
		for (CartDto cart : cartDto.getCartList()) {
			list.add(cart.getNo());
		}
			
		cartService.cartDelete(list);
		
		return "redirect:/cart/list.do";
	}
	
	
	@RequestMapping(value="/cart/ajax/quantityModify.do", method=RequestMethod.POST)
	@ResponseBody
	public void cartQuantityModify(CartDto cartDto) {
		
		cartService.quantityModify(cartDto);
	}
	
}
