package com.mealmaker.babiyo.ranking;

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
public class rankingController {

	private static final Logger logger 
		= LoggerFactory.getLogger(rankingController.class);
	
//	@Autowired
//	private OrderService orderService;
	
	@RequestMapping(value = "/ranking.do", method = RequestMethod.GET)
	public String ranking(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "ranking/ranking";
	}

}
