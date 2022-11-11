package com.mealmaker.babiyo.order.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mealmaker.babiyo.order.service.OrderService;

// 어노테이션 드리븐
@Controller
public class OrderController {

	private static final Logger logger 
		= LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		String id = orderService.selectId();
		
		
		return "order/home";
	}
	
	
	
}
