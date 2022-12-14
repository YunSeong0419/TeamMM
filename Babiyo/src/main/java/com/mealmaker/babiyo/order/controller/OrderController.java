package com.mealmaker.babiyo.order.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mealmaker.babiyo.cart.service.CartService;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.order.model.OrderDetailDto;
import com.mealmaker.babiyo.order.model.OrderDto;
import com.mealmaker.babiyo.order.service.OrderService;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

// 어노테이션 드리븐
@Controller
@SessionAttributes("_memberDto_")
public class OrderController {

	private static final Logger logger 
		= LoggerFactory.getLogger(OrderController.class);
	
	private final OrderService orderService;
	
	@Resource
	private CartService cartService;
	
	@Autowired
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@RequestMapping(value = "/order/order.do", method = RequestMethod.POST)
	public String order(OrderDetailDto orderDetailDto, Model model) {
		logger.info("주문화면 {}", orderDetailDto.getOrderDetailList());

		List<OrderDetailDto> orderDetailList = orderDetailDto.getOrderDetailList();
		
		model.addAttribute("orderDetailList", orderDetailList);
		
		return "order/orderForm";
	}
	
	@RequestMapping(value = "/order/orderCtr.do", method = RequestMethod.POST)
	public String orderCtr(@ModelAttribute("_memberDto_") MemberDto memberDto
			,OrderDto orderDto, OrderDetailDto orderDetailDto, Model model) {
		logger.info("Welcome OrderController orderCtr! " + orderDto);
		
		String memberId = memberDto.getId();
		orderDto.setMemberId(memberId);
		
		int orderNo = orderService.order(orderDto, orderDetailDto);
		
		if(orderNo == -1) {
			return "redirect:/order/fail.do";
		}
		
		int balance = memberDto.getCash() - orderDto.getTotalAmount();
		memberDto.setCash(balance);
		
		return "redirect:/order/complete.do";
	}
	
	@RequestMapping(value = "/order/complete.do", method = RequestMethod.GET)
	public String orderComplete(@ModelAttribute("_memberDto_") MemberDto memberDto
			,HttpSession session, Model model) {
		logger.info("Welcome OrderController orderComplete! ");
		
		String memberId = memberDto.getId();
		OrderDto orderDto = orderService.lastOrder(memberId);
		
		model.addAttribute("orderDto", orderDto);
		
		return "order/orderComplete";
	}
	
	@RequestMapping(value = "/order/fail.do", method = RequestMethod.GET)
	public String orderFail(HttpSession session, Model model) {
		logger.info("Welcome OrderController orderComplete! ");
		
		return "order/orderFail";
	}
	
	
	
	@RequestMapping(value="/order/detail.do", method = RequestMethod.GET)
	public String memberOrderDetail(int orderNo, HttpSession session, Model model) {
		
		Map<String, Object> orderMap = orderService.orderView(orderNo);
		
		model.addAttribute("orderMap", orderMap);
		
		return "order/orderDetail";
	}
	
	@RequestMapping(value="/order/cancel.do", method = RequestMethod.POST)
	public String orderCancel(@ModelAttribute("_memberDto_") MemberDto memberDto,
			int orderNo, HttpSession session, Model model) {
		
		int totalAmount = orderService.orderCancel(orderNo);
		
		boolean adminCheck = memberDto.getGrade() == 1;
		
		if(adminCheck) {
			return "redirect:/admin/orderList.do?orderNo=";
		}
		
		int balance = memberDto.getCash() + totalAmount;
		memberDto.setCash(balance);
		
		return "redirect:/member/orderList.do?orderNo=";
	}
	
	@RequestMapping(value="/order/accept.do", method = RequestMethod.POST)
	public String orderAccept(int orderNo, HttpSession session, Model model) {
		
		orderService.orderAccept(orderNo);
		
		String url = "redirect:/order/detail.do?orderNo=" + orderNo;
		
		return url;
	}
	
	
	@RequestMapping(value = "/admin/orderList.do", method = RequestMethod.GET)
	public String adminOrderList(@RequestParam(defaultValue = "1") int curPage
			,SearchOption searchOption, HttpSession session, Model model) {
		logger.info("관리자 주문목록{}", searchOption);
		
		Map<String, Object> map = orderService.adminOrderList(searchOption, curPage);
		
		@SuppressWarnings("unchecked")
		List<OrderDto> orderList = (List<OrderDto>) map.get("orderList");
		
		Paging paging = (Paging) map.get("paging");
		
		List<Map<String, Object>> stateList = orderService.orderStateList();
		
		LocalDate today = LocalDate.now();
		
		model.addAttribute("today", today);
		model.addAttribute("paging", paging);
		model.addAttribute("orderList", orderList);
		model.addAttribute("stateList", stateList);
		
		return "admin/order/adminOrderList";
	}
	
	@RequestMapping(value = "/member/orderList.do", method = RequestMethod.GET)
	public String memberOrderList(@ModelAttribute("_memberDto_") MemberDto memberDto
			,@RequestParam(defaultValue = "1") int curPage
			, SearchOption searchOption
			, HttpSession session, Model model) {
		logger.info("회원 주문목록 {}", searchOption);
		
		String memberId = memberDto.getId();
		
		List<Map<String, Object>> stateList = orderService.orderStateList();
		
		Map<String, Object> map = orderService.orderList(memberId, searchOption, curPage);
		
		@SuppressWarnings("unchecked")
		List<OrderDto> orderList = (List<OrderDto>) map.get("orderList");
				
		Paging paging = (Paging) map.get("paging");
		
		model.addAttribute("paging", paging);
		model.addAttribute("orderList", orderList);
		model.addAttribute("stateList", stateList);
		
		return "order/memberOrderList";
	}
	
	@RequestMapping(value = "/admin/sales.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String sales(Model model, SearchOption searchOption, String yearSel) {
		logger.info("관리자 매출관리");
		
		List<OrderDetailDto> salesList = orderService.salesView(searchOption);
		
		LocalDate today = LocalDate.now();
		
		model.addAttribute("today", today);
		model.addAttribute("salesList", salesList);
		model.addAttribute("yearSel", yearSel);
		
		return "admin/order/sales";
	}
	
}
