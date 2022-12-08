package com.mealmaker.babiyo.inquiry.controller;

import java.util.HashMap;
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

import com.mealmaker.babiyo.inquiry.model.InquiryDto;
import com.mealmaker.babiyo.inquiry.service.InquiryService;
import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

// 어노테이션 드리븐
@Controller
public class InquiryController {

	private static final Logger logger = LoggerFactory.getLogger(InquiryController.class);

	@Autowired
	private InquiryService inquiryService;
	
	@Resource
	private MemberDao memberDao;
	//회원
	// 문의 게시글 목록
	@RequestMapping(value = "/inquiry/member.do", method = RequestMethod.GET)
	public String memberInquiry(@RequestParam(defaultValue = "1") int curPage
			,@RequestParam(defaultValue = "0")int answerState
			,@RequestParam(defaultValue = "0") int categoryCode
			, HttpSession session, Model model) {
		logger.info("Welcome InquiryMemberController list! ");

		MemberDto memberDto = (MemberDto) session.getAttribute("_memberDto_"); 
		String memberId = memberDto.getId();
		
		Map<String, Object> map = inquiryService.inquiryList(memberId, answerState, categoryCode, curPage);
		
		//문의글 리스트
		@SuppressWarnings("unchecked")
		List<InquiryDto> memberList = (List<InquiryDto>) map.get("inquiryList");
		Paging paging = (Paging) map.get("paging");
		
		//분류 리스트
		List<Map<String, Object>> categoryCodeList = inquiryService.categoryCodeList();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("memberId", memberId);
		searchMap.put("answerState", answerState);
		searchMap.put("categoryCode", categoryCode);
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("categoryCodeList", categoryCodeList);
		model.addAttribute("paging", paging);
		model.addAttribute("searchMap", searchMap);

		return "inquiry/memberInquiryListView";
	}

	// 문의 게시글 상세
	@RequestMapping(value = "/inquiry/member/detail.do", method = RequestMethod.GET)
	public String memberDetail(int no, HttpSession session, Model model) {
		logger.info("Welcome InquiryMemberController detail! ");

		Map<String, Object> map = inquiryService.inquirySelectOne(no);
		
		InquiryDto inquiryDto = (InquiryDto) map.get("inquiryDto");
		
		model.addAttribute("inquiryDto", inquiryDto); 
		 
		return "inquiry/memberInquiryDetail";
	}

	// 문의 게시글 작성 화면으로
	@RequestMapping(value = "/inquiry/member/write.do", method = RequestMethod.GET)
	public String memberWrite(HttpSession session, Model model) {
		logger.info("Welcome InquiryMemberController write! ");

		return "inquiry/memberInquiryWrite";
	}
	// 문의 게시글 작성
	@RequestMapping(value = "/inquiry/member/writeCtr.do", method = RequestMethod.POST)
	public String memberWriteCtr(InquiryDto inquiryDto, MemberDto memberDto, Model model) {
		logger.info("Welcome InquiryMemberController memberWrite 신규 문의 작성! ");

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
		
		return "inquiry/memberInquiryUpdate";
	}
	
	// 문의 게시글 수정
	@RequestMapping(value = "/inquiry/member/updateCtr.do", method = RequestMethod.POST)
	public String memberUpdateCtr(InquiryDto inquiryDto, Model model) {
		logger.info("Welcome InquiryMemberController updateCtr! {}", inquiryDto);
		
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
	
	// 관리자
	// 문의 게시글 목록
	@RequestMapping(value = "/inquiry/admin.do", method = RequestMethod.GET)
	public String adminInquiry(@RequestParam(defaultValue = "1") int curPage
			,@RequestParam(defaultValue = "") String search
			,@RequestParam(defaultValue = "0")int answerState
			,@RequestParam(defaultValue = "0") int categoryCode
			, HttpSession session, Model model) {
		logger.info("Welcome adminInquiryController list! ");
		
		Map<String, Object> map = inquiryService.adminInquiryList(search ,answerState, categoryCode, curPage);
		
		//문의글 리스트
		@SuppressWarnings("unchecked")
		List<InquiryDto> adminList = (List<InquiryDto>) map.get("inquiryList");
		Paging paging = (Paging) map.get("paging");
		
		//분류 리스트
		List<Map<String, Object>> categoryCodeList = inquiryService.categoryCodeList();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("search", search);
		searchMap.put("answerState", answerState);
		searchMap.put("categoryCode", categoryCode);
		
		model.addAttribute("adminList", adminList);
		model.addAttribute("categoryCodeList", categoryCodeList);
		model.addAttribute("paging", paging);
		model.addAttribute("searchMap", searchMap);

		return "admin/inquiry/adminInquiryListView";
	}
	
	
	//문의 답변 화면 
	@RequestMapping(value = "/inquiry/admin/answer.do", method = RequestMethod.GET)
	public String adminAnswer(int no, HttpSession session, Model model) {
		logger.info("Welcome adminInquiryController write! ");

		Map<String, Object> map = inquiryService.adminInquirySelectOne(no);
		
		InquiryDto inquiryDto = (InquiryDto) map.get("inquiryDto");
		
		model.addAttribute("inquiryDto", inquiryDto); 
		
		
		return "admin/inquiry/adminInquiryAnswer";
	}
	// 문의 답변, 수정
	@RequestMapping(value = "/inquiry/admin/answerCtr.do", method = RequestMethod.POST)
	public String adminAnswerCtr(InquiryDto inquiryDto, Model model) {
		logger.info("Welcome adminInquiryController memberWrite 문의 답변! ");
		
		inquiryService.adminAnswer(inquiryDto);
		
		int no = inquiryDto.getNo();

		return "redirect:/inquiry/admin/answer.do?no=" + no;
	}
	
	// 답변 삭제
		@RequestMapping(value = "/inquiry/admin/deleteCtr.do", method = RequestMethod.GET)
		public String adminDelete(InquiryDto inquiryDto, Model model) {
			logger.info("Welcome adminInquiryController delete! " + inquiryDto);
			
			inquiryService.adminInquiryDeleteOne(inquiryDto);
			
			int no = inquiryDto.getNo();
			
			return "redirect:/inquiry/admin/answer.do?no=" + no;
		}
	
}
