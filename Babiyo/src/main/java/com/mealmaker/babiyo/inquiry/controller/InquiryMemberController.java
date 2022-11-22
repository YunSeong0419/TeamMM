package com.mealmaker.babiyo.inquiry.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;
import com.mealmaker.babiyo.inquiry.service.InquiryService;
import com.mealmaker.babiyo.member.model.MemberDto;

// 어노테이션 드리븐
@Controller
public class InquiryMemberController {

	private static final Logger logger 
		= LoggerFactory.getLogger(InquiryMemberController.class);
	
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping(value = "/inquiry/member.do", method = RequestMethod.GET)
	public String memberInquiry(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		List<InquiryDto> inquiryList = inquiryService.inquirySelectList();
		
		model.addAttribute("inquiryList", inquiryList);
		
		return "inquiry/member/memberInquiryListView";
	}
	
	@RequestMapping(value = "/inquiry/member/detail.do", method = RequestMethod.GET)
	public String memberDetail(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "inquiry/member/memberInquiryDetail";
	}
	
	@RequestMapping(value = "/inquiry/member/write.do", method = RequestMethod.GET)
	public String memberWrite(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		MemberDto memberDto = 
				new MemberDto("test", "123", "테스트", "test@test.com",
				null, "남", "010010101", "테스트", 0, 2, null, null);
		
		
		model.addAttribute("memberDto", memberDto);
		
		
		return "inquiry/member/memberInquiryWrite";
	}
	
	@RequestMapping(value = "/inquiry/member/writeCtr.do", method = RequestMethod.POST)
	public String memberWrite(InquiryDto inquiryDto, MemberDto memberDto, Model model) {
		logger.info("Welcome MemberWriteController memberWrite 신규 문의 작성! "
				+ inquiryDto);
		try {
			inquiryService.inquiry(inquiryDto);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("예외 처리");
			e.printStackTrace();
		}
		
		
		return "redirect:/inquiry/member.do";
	}
	
	@RequestMapping(value = "/inquiry/member/update.do", method = RequestMethod.GET)
	public String memberUpdate(HttpSession session, Model model) {
		logger.info("Welcome OrderController login! ");
		
		return "inquiry/member/memberInquiryUpdate";
	}

}
