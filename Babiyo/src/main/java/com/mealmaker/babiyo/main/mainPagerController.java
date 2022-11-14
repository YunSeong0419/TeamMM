package com.mealmaker.babiyo.main;

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
public class mainPagerController {

	private static final Logger logger 
		= LoggerFactory.getLogger(mainPagerController.class);
	
	@RequestMapping(value = "/member/main.do", method = RequestMethod.GET)
	public String mainPage(HttpSession session, Model model) {
		logger.info("Welcome Controller main! ");
		
		return "member/mainPage";
	}

	@RequestMapping(value = "/member/union.do", method = RequestMethod.GET)
	public String union(HttpSession session, Model model) {
		logger.info("Welcome Controller union! ");
		
		return "member/union";
	}
}

