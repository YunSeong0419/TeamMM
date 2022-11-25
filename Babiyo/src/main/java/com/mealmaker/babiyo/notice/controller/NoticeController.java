package com.mealmaker.babiyo.notice.controller;

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

import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.notice.model.NoticeImageDto;
import com.mealmaker.babiyo.notice.service.NoticeService;

// 어노테이션 드리븐
@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;
	//관리자
	//공지 게시판
	@RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
	public String noticeList(HttpSession session, Model model) {
		logger.info("Welcome NoticeController list! ");
		
		List<NoticeDto> noticeList = noticeService.noticeSelectList();
		
		model.addAttribute("noticeList" ,noticeList);

		return "notice/noticeListView";
	}
	
	//공지 게시글 작성 화면으로
	@RequestMapping(value = "/notice/write.do", method = RequestMethod.GET)
	public String noticeWrite(HttpSession session, Model model) {
		logger.info("Welcome NoticeController write! ");

		return "notice/adminNoticeWrite";
	}
	
	//공지 게시글 작성
	@RequestMapping(value = "/notice/writeCtr.do", method = RequestMethod.POST)
	public String noticeWriteCtr(NoticeDto noticeDto, NoticeImageDto noticeImageDto, Model model) {
		logger.info("Welcome InquiryMemberController memberWrite 신규 공지 작성! ");

//		noticeService.noticeWrite(noticeDto);

		return "redirect:/notice/member.do";
	}
	
	
	//공지 상세 
	@RequestMapping(value = "/notice/detail.do", method = RequestMethod.GET)
	public String noticeDetail(int no, HttpSession session, Model model) {
		logger.info("Welcome NoticeController detail! ");

		Map<String, Object> map = noticeService.noticeSelectOne(no);
		
		NoticeDto noticeDto = (NoticeDto) map.get("noticeDto");
		
		model.addAttribute("noticeDto", noticeDto);
		 
		return "notice/noticeDetail";
	}
	
	//공지 수정화면으로
	@RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
	public String noticeUpdate(int no, Model model) {
		logger.info("Welcome NoticeController update! ");

		Map<String, Object> map = noticeService.noticeSelectOne(no);
		
		NoticeDto noticeDto = (NoticeDto) map.get("noticeDto");
		
		model.addAttribute("noticeDto", noticeDto);
		 
		return "notice/noticeUpate";
	}
	
	
	//공지 수정
	@RequestMapping(value = "/notice/updateCtr.do", method = RequestMethod.POST)
	public String noticeUpdateCtr(NoticeDto noticeDto, Model model) {
		logger.info("Welcome NoticeController update! ");

//		noticeService.noticeUpdate(noticeDto);
		 
		return "redirect:/notice/detail.do";
	}
	
	//공지 게시글 삭제
	@RequestMapping(value = "/notice/deleteCtr.do"
			, method = RequestMethod.GET)
	public String noticeDelete(int no, Model model) {
		logger.info("Welcome NoticeControllerdelete delete! ");
		
		noticeService.noticeDeleteOne(no);
		
		return "redirect:/notice/list.do";
	}
	
}	