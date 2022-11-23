package com.mealmaker.babiyo.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mealmaker.babiyo.main.service.MainService;

// 어노테이션 드리븐
@Controller
public class MainController {

	private static final Logger logger 
		= LoggerFactory.getLogger(MainController.class);
	
//	@Autowired
//	private MainService mainService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mainPage(HttpSession session, Model model) {
		logger.info("Welcome Controller main! ");
		
		return "main/main";
	}

	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String categoryPage(HttpSession session, Model model) {
		logger.info("Welcome Controller category! ");
		
		return "main/category";
	}
}

