package com.mealmaker.babiyo.ranking.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mealmaker.babiyo.product.model.ProductDto;
import com.mealmaker.babiyo.ranking.service.RankingService;

// 어노테이션 드리븐
@Controller
public class RankingController {

	private static final Logger logger 
		= LoggerFactory.getLogger(RankingController.class);
	
	@Autowired
	private RankingService rankingService;
	
	@RequestMapping(value = "/ranking.do", method = RequestMethod.GET)
	public String ranking(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		List<ProductDto>toDayList = rankingService.toDayList();
		List<ProductDto>weeklyList = rankingService.weeklyList();
		List<ProductDto>manList = rankingService.manList();
		List<ProductDto>womanList = rankingService.womanList();
			
		model.addAttribute("toDayList", toDayList);
		model.addAttribute("weeklyList", weeklyList);
		model.addAttribute("manList", manList);
		model.addAttribute("womanList", womanList);
		
		return "ranking/ranking";
	}

}
