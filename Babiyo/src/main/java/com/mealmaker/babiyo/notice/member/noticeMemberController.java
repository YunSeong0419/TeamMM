package com.mealmaker.babiyo.notice.member;

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
public class noticeMemberController {

	private static final Logger logger 
		= LoggerFactory.getLogger(noticeMemberController.class);
	
//	@Autowired
//	private OrderService orderService;
	
	@RequestMapping(value = "/notice/member.do", method = RequestMethod.GET)
	public String memberNotice(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "notice/member/memberNotice";
	}
	
	@RequestMapping(value = "/notice/member/detail.do", method = RequestMethod.GET)
	public String memberDetail(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "notice/member/memberNoticeDetail";
	}
		
	
}
