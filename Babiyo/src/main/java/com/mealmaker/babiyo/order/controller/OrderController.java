package com.mealmaker.babiyo.order.controller;

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

import com.mealmaker.babiyo.cart.model.CartDto;
import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.order.service.OrderService;

// 어노테이션 드리븐
@Controller
public class OrderController {

	private static final Logger logger 
		= LoggerFactory.getLogger(OrderController.class);
	
	private final OrderService orderService;
	
	@Resource
	MemberDao memberDao;
	
	@Autowired
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@RequestMapping(value = "/order/order.do", method = RequestMethod.POST)
	public String order(OrderDetailDto orderDetailDto, CartDto cartDto, HttpSession session, Model model) {
		logger.info("Welcome OrderController order! ");

		List<OrderDetailDto> orderDetailList = orderDetailDto.getOrderDetailList();
		
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("cartDto", cartDto);
		
		return "order/orderForm";
	}
	
	@RequestMapping(value = "/order/orderCtr.do", method = RequestMethod.POST)
	public String orderCtr(OrderDto orderDto, OrderDetailDto orderDetailDto, CartDto cartDto, HttpSession session, Model model) {
		logger.info("Welcome OrderController orderCtr! " + orderDto);
		
		List<OrderDetailDto> detailList = orderDetailDto.getOrderDetailList();
		
		int orderNo = orderService.order(orderDto, detailList);
		
		
		return "redirect:/order/orderComplete.do?orderNo=" + orderNo;
	}
	
	@RequestMapping(value = "/order/orderComplete.do", method = RequestMethod.GET)
	public String orderComplete(HttpSession session, Model model) {
		logger.info("Welcome OrderController orderComplete! ");
		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		
		String memberId = memberDto.getId();
		
		OrderDto orderDto = orderService.lastOrder(memberId);
		
		model.addAttribute("orderDto", orderDto);
		
		return "order/orderComplete";
	}
	
	
}
