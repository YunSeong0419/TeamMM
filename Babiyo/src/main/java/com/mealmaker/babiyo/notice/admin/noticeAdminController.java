package com.mealmaker.babiyo.notice.admin;

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
public class noticeAdminController {

	private static final Logger logger 
		= LoggerFactory.getLogger(noticeAdminController.class);
	
//	@Autowired
//	private OrderService orderService;
	
	@RequestMapping(value = "/notice/admin.do", method = RequestMethod.GET)
	public String adminNotice(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "notice/admin/adminNotice";
	}
	
	@RequestMapping(value = "/notice/admin/detail.do", method = RequestMethod.GET)
	public String adminDetail(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "notice/admin/adminNoticeDetail";
	}
	
	@RequestMapping(value = "/notice/admin/update.do", method = RequestMethod.GET)
	public String adminUpdate(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "notice/admin/adminNoticeUpdate";
	}
	
	@RequestMapping(value = "/notice/admin/write.do", method = RequestMethod.GET)
	public String adminWrite(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "notice/admin/adminNoticeWrite";
	}	
	
}
