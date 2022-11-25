package com.mealmaker.babiyo.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mealmaker.babiyo.main.service.MainService;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.product.service.ProductService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

//	@Autowired
//	private MainService mainService;

	@Resource
	private ProductService productService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("MainController main! ");
		
		List<Map<String, Object>> newProductList = productService.newProductList();
		
		model.addAttribute("newProductList", newProductList);
			
		return "main/main";
	}
	
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String productCategory(Model model) {
		logger.info("Welcome Controller category! ");

		return "main/category";
	}
}
