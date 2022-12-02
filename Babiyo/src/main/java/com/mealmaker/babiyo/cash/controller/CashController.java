package com.mealmaker.babiyo.cash.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.cash.service.CashService;

// 어노테이션 드리븐
@Controller
public class CashController {

	private static final Logger logger 
		= LoggerFactory.getLogger(CashController.class);
	
	@Autowired
	private CashService cashService;
	
	@RequestMapping(value = "/cash/chargeCash.do", method = RequestMethod.GET)
	public String chargeCash(HttpSession session, Model model) {
		logger.info("Welcome CashController chargeCash! ");
		
		
		return "/cash/chargeCash";
	}
	
	@RequestMapping(value = "/cash/chargeCashCtr.do", method = RequestMethod.POST)
	public String cashAdd(MemberDto memberDto, HttpSession session, Model model) {
		logger.info("Welcome  CashController chargeCashOne! " + memberDto.getCash());
		
		MemberDto memberDtoSession = cashService.cashChargeOne(memberDto);
		
		session.setAttribute("_memberDto_", memberDtoSession);
		
		return "redirect:/member/memberCash.do";
	}
	
}
