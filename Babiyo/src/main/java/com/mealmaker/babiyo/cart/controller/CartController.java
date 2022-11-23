package com.mealmaker.babiyo.cart.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.mealmaker.babiyo.cart.model.CartDto;
import com.mealmaker.babiyo.cart.service.CartService;
import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.MemberDto;

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
	
	@RequestMapping(value = "/cart/cartView.do", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model) {
		logger.info("장바구니 목록");

		MemberDto memberDto = memberDao.memberExist("dong", "123");
		session.setAttribute("_memberDto_", memberDto);
		
		String memberId= memberDto.getId();
		
		List<CartDto> list = cartService.cartList(memberId);
		
		model.addAttribute("cartList", list);
		
		return "cart/cartList";
	}
	
	
	@RequestMapping(value="/cart/cartDelete.do", method = RequestMethod.POST)
	public String cartDelete(CartDto cartDto, HttpSession session, Model model) {
		logger.info("장바구니 삭제 {}" , cartDto.getCartList());
		
		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		String memberId = memberDto.getId();
		
		List<CartDto> cartList = cartDto.getCartList();
		
		for (CartDto cart : cartList) {
			cart.setMemberId(memberId);
		}
		
		cartService.cartDelete(cartList);
		
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
