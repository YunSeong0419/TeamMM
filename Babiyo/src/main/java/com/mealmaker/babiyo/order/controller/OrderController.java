package com.mealmaker.babiyo.order.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.mealmaker.babiyo.cart.model.CartDto;
import com.mealmaker.babiyo.cart.service.CartService;
import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.order.service.OrderService;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

// 어노테이션 드리븐
@Controller
public class OrderController {

	private static final Logger logger 
		= LoggerFactory.getLogger(OrderController.class);
	
	private final OrderService orderService;
	
	@Resource
	private CartService cartService;
	
	@Resource
	private MemberDao memberDao;
	
	@Autowired
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@RequestMapping(value = "/order/order.do", method = RequestMethod.POST)
	public String order(OrderDetailDto orderDetailDto, CartDto cartDto, HttpSession session, Model model) {
		logger.info("Welcome OrderController order! ");

		List<OrderDetailDto> orderDetailList = orderDetailDto.getOrderDetailList();
		
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("cartDto", cartDto);
		
		return "order/orderForm";
	}
	
	@RequestMapping(value = "/order/orderCtr.do", method = RequestMethod.POST)
	public String orderCtr(OrderDto orderDto, OrderDetailDto orderDetailDto
			,CartDto cartDto, HttpSession session, Model model) {
		logger.info("Welcome OrderController orderCtr! " + orderDto + cartDto);
		
		List<OrderDetailDto> detailList = orderDetailDto.getOrderDetailList();
		
		int orderNo = orderService.order(orderDto, detailList);
		
		if(cartDto != null) {
			List<Integer> list = new ArrayList<Integer>();
			
			for (CartDto cart : cartDto.getCartList()) {
				list.add(cart.getNo());
				System.out.println(cart.getNo());
			}
			cartService.cartDelete(list);
		}
		 
		
		return "redirect:/order/complete.do";
	}
	
	@RequestMapping(value = "/order/complete.do", method = RequestMethod.GET)
	public String orderComplete(HttpSession session, Model model) {
		logger.info("Welcome OrderController orderComplete! ");
		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		
		String memberId = memberDto.getId();
		OrderDto orderDto = orderService.lastOrder(memberId);
		
		model.addAttribute("orderDto", orderDto);
		
		return "order/orderComplete";
	}
	
	@RequestMapping(value = "/order/member/list.do", method = RequestMethod.GET)
	public String memberOrderList(@RequestParam(defaultValue = "1") int curPage, SearchOption searchOption
			, HttpSession session, Model model) {
		logger.info("Welcome OrderController memberOrderList! ");
		
		MemberDto memberDto = memberDao.memberExist("dong", "123");
		session.setAttribute("_memberDto_", memberDto);
		
		String memberId = memberDto.getId();
		int totalCount = orderService.memberOrderCount(memberId, searchOption);
		
		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<OrderDto> orderList = orderService.orderList(memberId, begin, end, searchOption);
		List<Map<String, Object>> stateList = orderService.orderStateList();
		
		model.addAttribute("paging", paging);
		model.addAttribute("orderList", orderList);
		model.addAttribute("stateList", stateList);
		model.addAttribute("searchOption", searchOption);
		
		return "order/memberOrderList";
	}
	
	@RequestMapping(value="/order/member/detail.do", method = RequestMethod.GET)
	public String memberOrderDetail(int orderNo, HttpSession session, Model model) {
		
		Map<String, Object> orderMap = orderService.orderView(orderNo);
		
		model.addAttribute("orderMap", orderMap);
		
		return "/order/memberOrderDetail";
	}
	
	@RequestMapping(value="/order/cancel.do", method = RequestMethod.GET)
	public String orderCancel(int orderNo, String backPage, HttpSession session, Model model) {
		
		orderService.orderCancel(orderNo);
		
		String url = "";
		
		if(backPage.equals("detail")) {
			url = "redirect:/order/member/detail.do?orderNo=" + orderNo;
		} else if(backPage.equals("list")) {
			url = "redirect:/order/member/list.do?orderNo=" + orderNo;
		}
		
		return url;
	}
	
	@RequestMapping(value = "/order/admin/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminOrderList(@RequestParam(defaultValue = "1") int curPage
			,SearchOption searchOption, HttpSession session, Model model) {
		logger.info("Welcome OrderController memberOrderList! ");
		
		Date today = new Date();
		
		if(searchOption.getBeginDate() == null) {
			searchOption = new SearchOption();
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(today);
			cal.add(Calendar.MONTH, -1);
			
			Date beforeMonth = cal.getTime();
			
			searchOption.setBeginDate(beforeMonth);
			searchOption.setEndDate(today);
		}
		
		if(searchOption.getSearch() == null) {
			searchOption.setSearch("");
		}
		
		MemberDto memberDto = memberDao.memberExist("admin", "123");
		
		session.setAttribute("_memberDto_", memberDto);
		
		int totalCount = orderService.adminOrderCount(searchOption);
		
		Paging paging = new Paging(totalCount, curPage);
		
		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		List<OrderDto> orderList = orderService.adminOrderList(begin, end, searchOption);
		List<Map<String, Object>> stateList = orderService.orderStateList();
		
		model.addAttribute("paging", paging);
		model.addAttribute("orderList", orderList);
		model.addAttribute("stateList", stateList);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("today", today);
		
		return "order/adminOrderList";
	}
	
	
}
