package com.mealmaker.babiyo.inquiry.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mealmaker.babiyo.inquiry.model.InquiryDto;
import com.mealmaker.babiyo.inquiry.service.InquiryService;
import com.mealmaker.babiyo.member.model.MemberDto;

// 어노테이션 드리븐
@Controller
public class InquiryMemberController {

	private static final Logger logger = LoggerFactory.getLogger(InquiryMemberController.class);

	@Autowired
	private InquiryService inquiryService;

	// 문의 게시글 목록
	@RequestMapping(value = "/inquiry/member.do", method = RequestMethod.GET)
	public String memberInquiry(HttpSession session, Model model) {
		logger.info("Welcome InquiryMemberController list! ");

		List<InquiryDto> inquiryList = inquiryService.inquirySelectList();

		model.addAttribute("inquiryList", inquiryList);

		return "inquiry/member/memberInquiryListView";
	}

	// 문의 게시글 상세
	@RequestMapping(value = "/inquiry/member/detail.do", method = RequestMethod.GET)
	public String memberDetail(int no, HttpSession session, Model model) {
		logger.info("Welcome InquiryMemberController detail! ");

		Map<String, Object> map = inquiryService.inquirySelectOne(no);
		
		InquiryDto inquiryDto = (InquiryDto) map.get("inquiryDto");
		
		model.addAttribute("inquiryDto", inquiryDto); 
		 
		return "inquiry/member/memberInquiryDetail";
	}

	// 문의 게시글 작성
	@RequestMapping(value = "/inquiry/member/write.do", method = RequestMethod.GET)
	public String memberWrite(HttpSession session, Model model) {
		logger.info("Welcome InquiryMemberController write! ");

		MemberDto memberDto = new MemberDto("dong", "123", "이동현", "dong@test.com", null, "남", "01088294445", "동현",
				10000, 2, null, null);

		model.addAttribute("_memberDto_", memberDto);

		return "inquiry/member/memberInquiryWrite";
	}

	@RequestMapping(value = "/inquiry/member/writeCtr.do", method = RequestMethod.POST)
	public String memberWrite(InquiryDto inquiryDto, MemberDto memberDto, Model model) {
		logger.info("Welcome InquiryMemberController memberWrite 신규 문의 작성! " + inquiryDto);

		inquiryService.inquiryWrite(inquiryDto);

		return "redirect:/inquiry/member.do";
	}

	// 문의 게시글 수정 화면으로
	@RequestMapping(value = "/inquiry/member/update.do", method = RequestMethod.GET)
	public String memberUpdate(int no, Model model) {
		logger.info("Welcome InquiryMemberController update! ");
		Map<String, Object> map = inquiryService.inquirySelectOne(no);
		
		InquiryDto inquiryDto = (InquiryDto) map.get("inquiryDto");
		
		model.addAttribute("inquiryDto", inquiryDto);
		
		return "inquiry/member/memberInquiryUpdate";
	}
	
	// 문의 게시글 수정
	@RequestMapping(value = "/inquiry/member/updateCtr.do", method = RequestMethod.POST)
	public String memberUpdateCtr(InquiryDto inquiryDto, Model model) {
		logger.info("Welcome InquiryMemberController updateCtr! ");
		
		inquiryService.inquiryUpdateOne(inquiryDto);
		
		return "redirect:/inquiry/member.do";
	}
	
	
	// 문의 게시글 삭제
	@RequestMapping(value = "/inquiry/member/deleteCtr.do"
			, method = RequestMethod.GET)
	public String memberDelete(int no, Model model) {
		logger.info("Welcome InquiryMemberController delete! ");
		
		inquiryService.inquiryDeleteOne(no);
		
		return "redirect:/inquiry/member.do";
	}

}
