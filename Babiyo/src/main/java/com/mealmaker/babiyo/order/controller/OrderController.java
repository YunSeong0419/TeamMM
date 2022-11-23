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
		logger.info("주문화면 {}", orderDetailDto.getOrderDetailList());

		List<OrderDetailDto> orderDetailList = orderDetailDto.getOrderDetailList();
		
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("cartDto", cartDto);
		
		return "order/orderForm";
	}
	
	@RequestMapping(value = "/order/orderCtr.do", method = RequestMethod.POST)
	public String orderCtr(OrderDto orderDto, OrderDetailDto orderDetailDto, HttpSession session, Model model) {
		logger.info("Welcome OrderController orderCtr! " + orderDto);
		
		List<OrderDetailDto> detailList = orderDetailDto.getOrderDetailList();
		
		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		
		String memberId = memberDto.getId();
		
		orderDto.setMemberId(memberId);
		
		orderService.order(orderDto, detailList);
		
		List<CartDto> list = new ArrayList<>();
		
		for (OrderDetailDto order : detailList) {
			CartDto cartDto = new CartDto();
			int productNo = order.getProductNo();
			
			cartDto.setMemberId(memberId);
			cartDto.setProductNo(productNo);
			
			list.add(cartDto);
		}
			
		cartService.cartDelete(list);
		 
		
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
	
	
	
	@RequestMapping(value="/order/detail.do", method = RequestMethod.GET)
	public String memberOrderDetail(int orderNo, HttpSession session, Model model) {
		
		Map<String, Object> orderMap = orderService.orderView(orderNo);
		
		model.addAttribute("orderMap", orderMap);
		
		return "/order/orderDetail";
	}
	
	@RequestMapping(value="/order/cancel.do", method = RequestMethod.GET)
	public String orderCancel(int orderNo, HttpSession session, Model model) {
		
		orderService.orderCancel(orderNo);
		
		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_");
		
		int grade = memberDto.getGrade();
		
		String url = "redirect:/";
		
		if(grade == 1) {
			url += "admin";
		} else {
			url += "member";
		}
		
		url += "/orderList.do?orderNo=" + orderNo;
		
		return url;
	}
	
	@RequestMapping(value="/order/accept.do", method = RequestMethod.GET)
	public String orderAccept(int orderNo, HttpSession session, Model model) {
		
		orderService.orderAccept(orderNo);
		
		String url = "redirect:/order/detail.do?orderNo=" + orderNo;
		
		return url;
	}
	
	
	@RequestMapping(value = "/admin/orderList.do", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/member/orderList.do", method = RequestMethod.GET)
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
	
}
