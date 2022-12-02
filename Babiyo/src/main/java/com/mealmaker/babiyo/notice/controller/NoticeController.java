package com.mealmaker.babiyo.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.notice.model.NoticeImageDto;
import com.mealmaker.babiyo.notice.service.NoticeService;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

// 어노테이션 드리븐
@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;
	//관리자
	//공지 게시판
	@RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
	public String noticeList(@RequestParam(defaultValue = "1") int curPage
			, SearchOption searchOption
			, HttpSession session, Model model) {
		logger.info("Welcome NoticeController list! ");
		
		Map<String, Object> map = noticeService.noticeList(searchOption, curPage);
		
		// 리스트
		@SuppressWarnings("unchecked")
		List<NoticeDto> noticeList = (List<NoticeDto>) map.get("noticeList");
		Paging paging = (Paging) map.get("paging");
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("paging", paging);
		model.addAttribute("searchOption", searchOption);

		return "notice/noticeListView";
	}
	
	//공지 게시글 작성 화면으로
	@RequestMapping(value = "/notice/write.do", method = RequestMethod.GET)
	public String noticeWrite(HttpSession session, Model model) {
		logger.info("Welcome NoticeController write! ");
		
		return "notice/noticeWrite";
	}
	
	//공지 게시글 작성
	@RequestMapping(value = "/notice/writeCtr.do", method = RequestMethod.POST)
	public String noticeWriteCtr(MultipartHttpServletRequest mulRequest
			, NoticeDto noticeDto, Model model) throws Exception {
		logger.info("Welcome NoticeController WriteCtr 신규 공지 작성! ");

		noticeService.noticeWrite(noticeDto, mulRequest);
	
		return "redirect:/notice/list.do";
	}
	
	
	//공지 상세 
	@RequestMapping(value = "/notice/detail.do", method = RequestMethod.GET)
	public String noticeDetail(NoticeDto noticeDto, int no, HttpSession session, Model model) {
		logger.info("Welcome NoticeController detail! ");

		noticeService.noticeHitPlus(noticeDto);	
		Map<String, Object> map = noticeService.noticeSelectOne(no);
		
		NoticeDto noticeDto2 = (NoticeDto) map.get("noticeDto");
		@SuppressWarnings("unchecked")
		Map<String, Object> noticeImg = (Map<String, Object>) map.get("imgMap");
		
		model.addAttribute("noticeDto", noticeDto2);
		model.addAttribute("noticeImg", noticeImg);
		 
		return "notice/noticeDetail";
	}
	
	//공지 수정화면으로
	@RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
	public String noticeUpdate(int no, Model model) {
		logger.info("Welcome NoticeController update! ");

		Map<String, Object> map = noticeService.noticeSelectOne(no);
		
		NoticeDto noticeDto = (NoticeDto) map.get("noticeDto");
		
		model.addAttribute("noticeDto", noticeDto);
		@SuppressWarnings("unchecked")
		Map<String, Object> noticeImg = (Map<String, Object>) map.get("imgMap");
		
		model.addAttribute("noticeDto", noticeDto);
		model.addAttribute("noticeImg", noticeImg); 
		
		return "notice/noticeUpate";
	}
	
	
	//공지 수정
	@RequestMapping(value = "/notice/updateCtr.do", method = {RequestMethod.GET ,RequestMethod.POST})
	public String noticeUpdateCtr(HttpSession session, NoticeDto noticeDto
			, @RequestParam(defaultValue = "-1") int imgNo
			, MultipartHttpServletRequest mulRequest
			, Model model) {
		logger.info("Welcome NoticeController updateCtr! imgNo : {} , {} ", imgNo , noticeDto);
		
		
		int resultNum = 0; 
			
		try {
			resultNum = noticeService.noticeUpdate(imgNo, noticeDto, mulRequest);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		int noticeNo = noticeDto.getNo();
	
		return "redirect:/notice/detail.do?no=" + noticeNo;
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