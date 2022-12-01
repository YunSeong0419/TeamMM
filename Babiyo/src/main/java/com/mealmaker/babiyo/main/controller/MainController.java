package com.mealmaker.babiyo.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.notice.service.NoticeService;
import com.mealmaker.babiyo.product.service.ProductService;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Resource
	private ProductService productService;
	
	@Resource
	private NoticeService noticeService;

	//오븐 14p, 메인
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(HttpSession session ,Model model) {
		logger.info("MainController main! ");
		
		MemberDto memberDto = (MemberDto)session.getAttribute("_memberDto_");
		String memberId = memberDto.getId();

		List<Map<String, Object>> recommendProductList = productService.recommendProductList(memberId);
		List<Map<String, Object>> newProductList = productService.newProductList();
		NoticeDto noticeDto = noticeService.mainLatestNotice();
		
		model.addAttribute("noticeDto", noticeDto);
		model.addAttribute("recommendProductList", recommendProductList);
		model.addAttribute("newProductList", newProductList);
			
		return "main/main";
	}
}