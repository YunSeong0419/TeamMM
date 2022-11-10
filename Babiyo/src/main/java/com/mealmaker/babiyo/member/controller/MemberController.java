//package com.mealmaker.babiyo.member.controller;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//
//import com.edu.member.model.MemberDto;
//import com.edu.member.service.MemberService;
//import com.edu.util.Paging;
//
//// 어노테이션 드리븐
//@Controller
//public class MemberController {
//
//	private static final Logger logger 
//		= LoggerFactory.getLogger(MemberController.class);
//	
//	@Autowired
//	private MemberService memberService;
//	
//	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
//	public String login(HttpSession session, Model model) {
//		logger.info("Welcome MemberController login! ");
//		
//		return "auth/LoginForm";
//	}
//	
//	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
//	public String loginCtr(String email, String password
//			, HttpSession session, Model model) {
//		logger.info("Welcome MemberController loginCtr! " + email 
//			+ ", " + password);
//		
//		MemberDto memberDto = memberService.memberExist(email, password);
//		
//		String viewUrl = "";
//		if(memberDto != null) {
//			session.setAttribute("_memberDto_", memberDto);
////			session.setMaxInactiveInterval(60);
//			
//			viewUrl = "redirect:/member/list.do";
//		}else {
//			viewUrl = "/auth/LoginFail";
//		}
//		
//		return viewUrl;
//	}
//	
//	//로그아웃
//	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
//	public String logout(HttpSession session, Model model) {
//		logger.info("Welcome MemberController logout! ");
//		
////		session.removeAttribute("member");
//		session.invalidate();
//		
//		return "redirect:/auth/login.do";
//	}
//	
//	// 회원목록 화면으로
//	@RequestMapping(value = "/member/list.do"
//		, method = {RequestMethod.GET, RequestMethod.POST})
//	public String memberList(@RequestParam(defaultValue = "1") int curPage,
//			@RequestParam(defaultValue = "") String keyword,
//			@RequestParam(defaultValue = "all") String searchOption, Model model) {
//		logger.info("Welcome MemberController memberList! curPgae: {}, keyword: {}"
//			, curPage, keyword);
//		
//		logger.info("searchOption:" + searchOption);
//		
//		int totalCount = memberService.memberSelectTotalCount(keyword, searchOption);
//		
//		Paging memberPaging = new Paging(totalCount, curPage);
//		int start = memberPaging.getPageBegin();
//		int end = memberPaging.getPageEnd();
//		
//		System.out.println("이거 확인해" + memberPaging.getCurPage());
//
//		List<MemberDto> memberList = 
//			memberService.memberSelectList(start, end, keyword, searchOption);
//		
//		Map<String, Object> pagingMap = new HashMap<String, Object>();
//		pagingMap.put("totalCount", totalCount);
//		pagingMap.put("memberPaging", memberPaging);
//		
//		Map<String, Object> searchMap = new HashMap<String, Object>();
//		searchMap.put("keyword", keyword);
//		searchMap.put("searchOption", searchOption);
//		
//		model.addAttribute("memberList", memberList);
//		model.addAttribute("pagingMap", pagingMap);
//		model.addAttribute("searchMap", searchMap);
//		
//		return "member/MemberListView";
//	}
//	
//	// 회원정보 상세 화면으로
//	@RequestMapping(value = "/member/one.do", method = RequestMethod.GET)
//	public String memberOne(int no, int curPage
//			, String keyword, String searchOption, Model model) {
//		logger.info("Welcome memberOne enter! - {}", no);
//		
//		Map<String, Object> map = memberService.memberSelectOne(no);
//		
//		MemberDto memberDto = (MemberDto) map.get("memberDto");
//		List<Map<String, Object>> fileList 
//			= (List<Map<String, Object>>) map.get("fileList");
//		
//		Map<String, Object> searchMap = new HashMap<String, Object>();
//		
//		searchMap.put("curPage", curPage);
//		searchMap.put("keyword", keyword);
//		searchMap.put("searchOption", searchOption);
//		
//		model.addAttribute("memberDto", memberDto);
//		model.addAttribute("fileList", fileList);
//		model.addAttribute("searchMap", searchMap);
//		
//		return "member/MemberOneView";
//	}
//	
//	@RequestMapping(value = "/member/add.do", method = RequestMethod.GET)
//	public String memberAdd(Model model) {
//		logger.debug("Welcome MemberController memberAdd! ");
//		
//		
//		return "member/MemberForm";
//	}
//	
//	@RequestMapping(value = "/member/addCtr.do", method = RequestMethod.POST)
//	public String memberAdd(MemberDto memberDto, 
//		MultipartHttpServletRequest mulRequest, Model model) {
//		logger.trace("Welcome MemberController memberAdd 신규등록 처리! " 
//			+ memberDto);
//		
//		try {
//			memberService.memberInsertOne(memberDto, mulRequest);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			System.out.println("오랜만에 예외 처리 한다");
//			System.out.println("파일 문제 예외일 가능성 높음");
//			e.printStackTrace();
//		}
//		
//		
//		return "redirect:/member/list.do";
//	}
//	
//	// 회원수정 화면으로
//	@RequestMapping(value = "/member/update.do", method = RequestMethod.GET)
//	public String memberUpdate(int no, int curPage
//			, String keyword, String searchOption, Model model) {
//		logger.debug("Welcome MemberController memberUpdate! " + no);
//		
//		Map<String, Object> map = memberService.memberSelectOne(no);
//		
//		MemberDto memberDto = (MemberDto)map.get("memberDto");
//		List<Map<String, Object>> fileList 
//			= (List<Map<String, Object>>) map.get("fileList");
//		
//		Map<String, Object> searchMap = new HashMap<String, Object>();
//		
//		searchMap.put("curPage", curPage);
//		searchMap.put("keyword", keyword);
//		searchMap.put("searchOption", searchOption);
//		
//		model.addAttribute("memberDto", memberDto);
//		model.addAttribute("fileList", fileList);
//		model.addAttribute("searchMap", searchMap);
//		
//		return "member/MemberUpdateForm";
//	}
//
//	// 회원수정
//	@RequestMapping(value = "/member/updateCtr.do"
//		, method = RequestMethod.POST)
//	public String memberUpdateCtr(HttpSession session,
//		MemberDto memberDto
//		, @RequestParam(value = "fileIdx", defaultValue = "-1") int fileIdx
//		, int curPage, String keyword, String searchOption
//		, MultipartHttpServletRequest multipartHttpServletRequest
//		, Model model) {
//		logger.info("Welcome MemberController memberUpdateCtr {} :: {}" 
//		 , memberDto, fileIdx);
//		
//		int resultNum = 0; 
//			
//		try {
//			resultNum = memberService.memberUpdateOne(memberDto
//				, multipartHttpServletRequest, fileIdx);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		// 데이터베이스에서 회원정보가 수정이 됐는지 여부😊😊
//		// 존재, 증명여부 
//		MemberDto sessionMemberDto 
//			= (MemberDto)session.getAttribute("_memberDto_");
//		
//		if(sessionMemberDto != null) {
//			if(sessionMemberDto.getNo() == memberDto.getNo()) {
//				MemberDto newMemberDto = new MemberDto();
//				
//				newMemberDto.setNo(memberDto.getNo());
//				newMemberDto.setEmail(memberDto.getEmail());
//				newMemberDto.setName(memberDto.getName());
//				
//				session.removeAttribute("_memberDto_");
//				
//				session.setAttribute("_memberDto_", newMemberDto);
//			}
//		}
//		
//		Map<String, Object> searchMap = new HashMap<String, Object>();
//		
//		searchMap.put("curPage", curPage);
//		searchMap.put("keyword", keyword);
//		searchMap.put("searchOption", searchOption);
//		
//		model.addAttribute("searchMap", searchMap);
//		model.addAttribute("memberDto", memberDto);
//		
//		return "common/sucessPage";
//	}
//	
//	// 회원탈퇴
//	@RequestMapping(value = "/member/deleteCtr.do"
//		, method = RequestMethod.GET)
//	public String memberDelete(int no, int curPage
//			, String keyword, String searchOption, Model model) {
//		logger.info("Welcome MemberController memberDelete! " + no);
//		
//		memberService.memberDeleteOne(no);
//		
//		Map<String, Object> searchMap = new HashMap<String, Object>();
//		
//		searchMap.put("curPage", curPage);
//		searchMap.put("keyword", keyword);
//		searchMap.put("searchOption", searchOption);
//		
//		model.addAttribute("searchMap", searchMap);
//		
//		return "member/MemberDelete";
//	}
//}
