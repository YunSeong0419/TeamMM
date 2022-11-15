package com.mealmaker.babiyo.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.order.service.OrderService;

// 어노테이션 드리븐
@Controller
public class OrderController {

	private static final Logger logger 
		= LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "/order/order.do", method = RequestMethod.GET)
	public String order(HttpSession session, Model model) {
		logger.info("Welcome OrderController order! ");

		List<OrderDetailDto> orderDetailList = new ArrayList<>();
		
		OrderDetailDto orderDetailDto = new OrderDetailDto();
		
		orderDetailDto.setProductNo(1);;
		orderDetailDto.setProductName("봉골레파스타");
		orderDetailDto.setPrice(7000);
		orderDetailDto.setAmount(3);
		
		orderDetailList.add(orderDetailDto);
		
		orderDetailDto = new OrderDetailDto();
		orderDetailDto.setProductNo(2);
		orderDetailDto.setProductName("까르보나라");
		orderDetailDto.setPrice(8000);
		orderDetailDto.setAmount(1);
		
		orderDetailList.add(orderDetailDto);
		
		orderDetailDto = new OrderDetailDto();
		orderDetailDto.setProductNo(3);
		orderDetailDto.setProductName("로제파스타");
		orderDetailDto.setPrice(6000);
		orderDetailDto.setAmount(2);
		
		orderDetailList.add(orderDetailDto);
		
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "order/orderForm";
	}
	
	@RequestMapping(value = "/order/orderCtr.do", method = RequestMethod.POST)
	public String orderCtr(OrderDto orderDto, OrderDetailDto orderDetailDto, HttpSession session, Model model) {
		logger.info("Welcome OrderController orderCtr! " + orderDto);
		
//		List<OrderDetailDto> detailList = orderDetailDto.getOrderDetailList();

//		orderService.order(orderDto, detailList);
		
		
		return "redirect:/order/orderComplete.do";
	}
	
	@RequestMapping(value = "/order/orderComplete.do", method = RequestMethod.GET)
	public String orderComplete(HttpSession session, Model model) {
		logger.info("Welcome OrderController orderComplete! ");
//		session.getAttribute("memberDto");
		
//		OrderDto orderDto = orderService.lastOrder();
		
		return "order/orderComplete";
	}
	
	
}
