package com.mealmaker.babiyo.review;

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
public class ReviewController {

	private static final Logger logger 
		= LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping(value = "/review/collection.do", method = RequestMethod.GET)
	public String reviewCollection(HttpSession session, Model model) {
		logger.info("Welcome Controller review collection! ");
		
		return "review/collection";
	}

}

