package com.mealmaker.babiyo.order.controller;

import java.util.ArrayList;
import java.util.Date;
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

		MemberDto memberDto = new MemberDto();
		
		String id = "dong";
		String password = "123";
		String name = "이동현";
		String email = "dong@test.com";
		String phone = "01055553333";
		String nickname = "동현";
		int cash = 1000000;
		int grade = 2;
		
		session.setAttribute("_memberDto_", memberDto);
		
		memberDto.setId(id);
		memberDto.setPassword(password);
		memberDto.setName(name);
		memberDto.setEmail(email);
		memberDto.setPhone(phone);
		memberDto.setNickname(nickname);
		memberDto.setCash(cash);
		memberDto.setGrade(grade);
		
		
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
