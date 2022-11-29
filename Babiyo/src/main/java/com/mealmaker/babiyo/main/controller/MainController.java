package com.mealmaker.babiyo.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.product.service.ProductService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Resource
	private ProductService productService;

	//오븐 14p, 메인
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Model model) {
		logger.info("MainController main! ");
		
		List<Map<String, Object>> recommendProductList = productService.recommendProductList();

		List<Map<String, Object>> newProductList = productService.newProductList();
		
		model.addAttribute("recommendProductList", recommendProductList);
		model.addAttribute("newProductList", newProductList);
			
		return "main/main";
	}
	
	//오븐 15p, 헤더-밀키트 카테고리
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String productCategory(Model model) {
		logger.info("MainController category! ");

		return "main/category";
	}
}
