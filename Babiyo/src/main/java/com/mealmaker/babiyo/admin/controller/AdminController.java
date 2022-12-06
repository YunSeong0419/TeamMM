package com.mealmaker.babiyo.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mealmaker.babiyo.admin.service.AdminService;

// 어노테이션 드리븐
@Controller
public class AdminController {

	private static final Logger logger 
		= LoggerFactory.getLogger(AdminController.class);
	
	private final AdminService adminService;
	
	@Autowired
	public AdminController(AdminService adminService) {
		// TODO Auto-generated constructor stub
		this.adminService = adminService;
	}
	
	@RequestMapping(value = "/admin/adminHome.do", method = RequestMethod.GET)
	public String adminHome(HttpSession session, Model model) {
		logger.info("관리자 화면");
		//주문과 문의 대기 갯수
		Map<String, Integer> countMap = adminService.waitCount();
		//일주일동안 하루매출 금액 리스트
//		List<Integer>  = adminService.salesChart();
		model.addAttribute("countMap", countMap);
		
		return "admin/adminHome";
	}
	
	@PostMapping(value="/admin/salesChart.do")
	@ResponseBody
	public List<Integer> ajaxSalesChart() {
		logger.info("ajax: 주간 매출금액 리스트 가져오기");
		
		List<Integer> salesList = adminService.salesChart();
		
		return salesList;
	}
	
	@PostMapping(value="/admin/productChart.do")
	@ResponseBody
	public Map<String, List<Object>> ajaxProductChart() {
		logger.info("ajax: 주간 상품별 판매개수 리스트 가져오기");
		
		Map<String, List<Object>> productList = adminService.productChart();
		
		return productList;
	}
	
}
