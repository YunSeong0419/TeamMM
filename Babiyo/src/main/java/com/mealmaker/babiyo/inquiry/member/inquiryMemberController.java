package com.mealmaker.babiyo.inquiry.member;

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
public class inquiryMemberController {

	private static final Logger logger 
		= LoggerFactory.getLogger(inquiryMemberController.class);
	
//	@Autowired
//	private OrderService orderService;
	
	@RequestMapping(value = "/inquiry/member.do", method = RequestMethod.GET)
	public String memberInquiry(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "inquiry/member/memberInquiry";
	}
	
	@RequestMapping(value = "/inquiry/member/detail.do", method = RequestMethod.GET)
	public String memberDetail(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "inquiry/member/memberInquiryDetail";
	}
	
	@RequestMapping(value = "/inquiry/member/write.do", method = RequestMethod.GET)
	public String memberWrite(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "inquiry/member/memberInquiryWrite";
	}
	
	@RequestMapping(value = "/inquiry/member/update.do", method = RequestMethod.GET)
	public String memberUpdate(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "inquiry/member/memberInquiryUpdate";
	}

}
