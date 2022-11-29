package com.mealmaker.babiyo.member.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.member.model.InterestDto;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.member.service.MemberService;

// 어노테이션 드리븐
@Controller
public class MemberController {

	private static final Logger logger 
		= LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
		logger.info("Welcome MemberController login! ");
		
		
		return "/auth/LoginForm";
	}
	
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String id, String password
			, HttpSession session, Model model) {
		logger.info("Welcome MemberController loginCtr! " + id 
			+ ", " + password);
		
		MemberDto memberDto = memberService.memberExist(id, password);
		logger.info("wel" + id + password);
		logger.info("wel" + memberDto);
		String viewUrl = "";
		if(memberDto != null) {
			session.setAttribute("_memberDto_", memberDto);
//			session.setMaxInactiveInterval(60);
			logger.info("Welcome");
			viewUrl = "/main/main";
		}else {
			viewUrl = "/auth/LoginFail";
		}
		
		return viewUrl;
	}
	
	//로그아웃
	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		logger.info("Welcome MemberController logout! ");
		
//		session.removeAttribute("member");
		session.invalidate();
		
		return "redirect:/auth/login.do";
	}
	

//	
	@RequestMapping(value = "/auth/member/add.do", method = RequestMethod.GET)
	public String memberAdd(Model model) {
		logger.debug("Welcome MemberController memberAdd! ");
		
		
		return "member/MemberJoin";
	}
	
	@RequestMapping(value = "/auth/member/addCtr.do", method = RequestMethod.POST)
	public String memberAdd(MemberDto memberDto, Model model) {
		logger.info("Welcome MemberController memberAdd 신규등록 처리! " 
				+ memberDto);
		memberService.memberInsertOne(memberDto);
		
		String memberId = memberDto.getId();
		
		return "redirect:/auth/member/addInterest.do?memberId=" + memberId;
	}
	
	@RequestMapping(value = "/auth/member/addInterest.do", method = RequestMethod.GET)
	public String memberAddInterest(String memberId, Model model) {
		logger.info("Welcome MemberController memberAdd 신규등록 처리! ");
		
		model.addAttribute("memberId", memberId);
		
		return "member/MemberInterest";
	}
	
	
	@RequestMapping(value = "/auth/member/addInterestCtr.do", method = RequestMethod.POST)
	public String addInterest(InterestDto interestDto, HttpSession session, Model model) {
		logger.info("Welcome InterestController memberAdd 신규등록 처리! ");
		
		memberService.addInterest(interestDto);
		
		logger.info("last" + interestDto);
		
		return "redirect:/auth/member/addComplete.do";
	}
	
	@RequestMapping(value = "/auth/member/addComplete.do", method = RequestMethod.GET)
	public String addInterest(HttpSession session, Model model) {
		logger.info("Welcome InterestController memberAdd 신규등록 처리! ");
		
		return "member/MemberJoinComplete";
	}
	
	
	@RequestMapping(value = "/auth/member/memberInfo.do", method = RequestMethod.GET)
	public String memberInfo(HttpSession session, Model model) {
		logger.info("Welcome MemberController memberInfo! ");
		
		return "/member/MemberInfo";
	}
//	
//	
//	// 회원수정 화면으로
//	@RequestMapping(value = "/member/update.do", method = RequestMethod.GET)
//	public String memberUpdate(int no, Model model) {
//		logger.debug("Welcome MemberController memberUpdate! " + no);
//		
//		Map<String, Object> map = memberService.memberSelectOne(no);
//		
//		MemberDto memberDto = (MemberDto)map.get("memberDto");
//		List<Map<String, Object>> fileList 
//			= (List<Map<String, Object>>) map.get("fileList");
//		
//		model.addAttribute("memberDto", memberDto);
//		model.addAttribute("fileList", fileList);
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
//			if(sessionMemberDto.getId() == memberDto.getId()) {
//				MemberDto newMemberDto = new MemberDto();
//				
//				newMemberDto.setId(memberDto.getId());
//				newMemberDto.setEmail(memberDto.getEmail());
//				newMemberDto.setName(memberDto.getName());
//				
//				session.removeAttribute("_memberDto_");
//				
//				session.setAttribute("_memberDto_", newMemberDto);
//			}
//		}
//		
//		
//		return "common/sucessPage";
//	}
//	
//	// 회원탈퇴
//	@RequestMapping(value = "/member/deleteCtr.do"
//		, method = RequestMethod.GET)
//	public String memberDelete(int no, Model model) {
//		logger.info("Welcome MemberController memberDelete! " + no);
//		
//		memberService.memberDeleteOne(no);
//		
//		return "redirect:/member/list.do";
//	}
//	// 회원목록 화면으로
//	@RequestMapping(value = "/member/list.do"
//		, method = {RequestMethod.GET, RequestMethod.POST})
//	public String memberList(@RequestParam(defaultValue = "1") int curPage
//		, @RequestParam(defaultValue = "all") String searchOption
//		, @RequestParam(defaultValue = "") String keyword
//		, Model model) {
//		logger.info("Welcome MemberController memberList! curPgae: {}"
//				+ ", searchOption: {}"
//			, curPage, searchOption);
//		logger.info("keyword: {}", keyword);
//		
//		// 처음부터 DB컬럼명을 잘못 구성해서 이사단이 남 후에 서로 일치시키자
//		if("name".equals(searchOption)) {
//			searchOption = "mname";
////			System.out.println(searchOption);
//		}
//		
//		int totalCount = 
//			memberService.memberSelectTotalCount(searchOption, keyword);
//		
//		Paging memberPaging = new Paging(totalCount, curPage);
//		int start = memberPaging.getPageBegin();
//		int end = memberPaging.getPageEnd();
//		
//		List<MemberDto> memberList = 
//			memberService.memberSelectList(searchOption, keyword, 
//				start, end);
//		
//		// DB에서 잘 사용했으니 이젠 화면에 맞게 되돌리기
//		if("mname".equals(searchOption)) {
//			searchOption = "name";
//		}
//		
//		Map<String, Object> searchMap = new HashMap<>();
//		searchMap.put("searchOption", searchOption);
//		searchMap.put("keyword", keyword);
//		
//		Map<String, Object> pagingMap = new HashMap<String, Object>();
//		pagingMap.put("totalCount", totalCount);
//		pagingMap.put("memberPaging", memberPaging);
//		
//		model.addAttribute("memberList", memberList);
//		model.addAttribute("searchMap", searchMap);
//		model.addAttribute("pagingMap", pagingMap);
//		
//		return "member/MemberListView";
//	}
//	
//	// 회원정보 상세 화면으로
//	@RequestMapping(value = "/member/one.do")
//	public String memberOne(int no, int curPage, String searchOption
//			, String keyword, Model model) {
//		logger.info("Welcome memberOne enter! - {}", no);
//		
//		Map<String, Object> map = memberService.memberSelectOne(no);
//		
//		MemberDto memberDto = (MemberDto) map.get("memberDto");
//		List<Map<String, Object>> fileList 
//			= (List<Map<String, Object>>) map.get("fileList");
//		
//		Map<String, Object> prevMap = new HashMap<>();
//		prevMap.put("curPage", curPage);
//		prevMap.put("searchOption", searchOption);
//		prevMap.put("keyword", keyword);
//		
//		model.addAttribute("memberDto", memberDto);
//		model.addAttribute("fileList", fileList);
//		model.addAttribute("prevMap", prevMap);
//		
//		
//		return "member/MemberOneView";
//	}
}
