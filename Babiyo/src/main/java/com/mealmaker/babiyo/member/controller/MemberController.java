package com.mealmaker.babiyo.member.controller;

import java.io.Console;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			logger.info("Welcome");
			viewUrl = "redirect:/main.do";
		}else {
			viewUrl = "/auth/LoginFail";
		}
		
		return viewUrl;
	}
	
	//로그아웃
	@RequestMapping(value = "/auth/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		logger.info("Welcome MemberController logout! ");
		
		session.invalidate();
		
		return "redirect:/auth/login.do";
	}
	

//	
	@RequestMapping(value = "/auth/member/add.do", method = RequestMethod.GET)
	public String memberAdd(Model model) {
		logger.debug("Welcome MemberController memberAdd! ");
		
		
		return "member/MemberJoin";
	}
	
	@PostMapping("/auth/member/idCheckCtr.do")
	@ResponseBody
	public int idCheck(@RequestParam("id") String id) {
		
		int cnt = memberService.idCheck(id);
		return cnt;
	}
	
	@PostMapping("/auth/member/emailCheckCtr.do")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		
		int cnt = memberService.emailCheck(email);
		return cnt;
	}
	
	@PostMapping("/auth/member/phoneCheckCtr.do")
	@ResponseBody
	public int phoneCheck(@RequestParam("phone") String phone) {
		
		int cnt = memberService.phoneCheck(phone);
		return cnt;
	}
	
	@PostMapping("/auth/member/nicknameCheckCtr.do")
	@ResponseBody
	public int nicknameCheck(@RequestParam("nickname") String nickname) {
		
		int cnt = memberService.nicknameCheck(nickname);
		return cnt;
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
		List<Map<String, Object>> categoryCodeList = memberService.categoryCodeList();
		model.addAttribute("categoryCodeList", categoryCodeList);
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
	
	
	@RequestMapping(value = "/member/checkInfo.do", method = RequestMethod.GET)
	public String checkInfo(HttpSession session, Model model) {
		logger.info("check your password! ");
		
		return "/member/CheckInfo";
	}
	
	
	@RequestMapping(value = "/member/memberUpdate.do", method = RequestMethod.GET)
	public String memberUpdate(HttpSession session, Model model) {
		logger.info("Welcome MemberController memberUpdate! ");
		
		MemberDto memberDto = (MemberDto)session.getAttribute("_memberDto_");
		String memberId = memberDto.getId();
		
		List<Map<String, Object>> categoryCodeList = memberService.categoryCodeList();
		List<Map<String, Object>> interestList = memberService.selectInterest(memberId);
		
		model.addAttribute("categoryCodeList", categoryCodeList);
		model.addAttribute("interestList", interestList);
		
		return "/member/MemberUpdate";
	}
	
	@RequestMapping(value = "/member/memberUpdateCtr.do", method = RequestMethod.POST)
	public String memberUpdateOne(MemberDto memberDto, Model model, HttpSession session
			, InterestDto interestDto) {
		logger.info("Welcome MemberController memberUpdate!" + memberDto);
		
		memberService.memberUpdateOne(memberDto);
		
		String memberId = memberDto.getId();
		interestDto.setMemberId(memberId);
		List<InterestDto> list = interestDto.getInterestList();
		
		for (InterestDto interest : list) {
			interest.setMemberId(memberId);
			
			memberService.UpdateInterest(interest);
		}
		
		session.setAttribute("_memberDto_", memberService.memberInfo(memberDto));
		
		System.out.println(interestDto);
		
		return "redirect:/member/memberInfo.do";
	}
	
	@RequestMapping(value = "/member/delete.do", method = RequestMethod.GET)
	public String memberDelete(HttpSession session, Model model) {
		logger.info("Welcome MemberController memberUpdate! ");
		
		return "/member/CheckOut";
	}
	
	
	// 회원탈퇴
		@RequestMapping(value = "/member/deleteCtr.do", method = RequestMethod.POST)
		public String memberDelete(MemberDto memberDto, Model model, HttpSession session) {
			logger.info("Welcome memberDelete! " + memberDto);
			
			memberService.memberDeleteOne(memberDto);
			
			return "redirect:/auth/login.do";
		}
	
//	@RequestMapping(value = "/member/UpdateInterestCtr.do", method = RequestMethod.POST)
//	public String UpdateInterest(InterestDto interestDto, Model model) {
//		logger.info("Welcome MemberController memberAdd 신규등록 처리! " 
//				+ interestDto);
//		memberService.UpdateInterest(interestDto);
//		
//		return "/member/MemberUpdate";
//	}
	
	// 회원정보
	@RequestMapping(value = "/member/memberInfo.do", method = RequestMethod.GET)
	public String memberInfo(HttpSession session, Model model) {
		logger.info("Welcome MemberController memberInfo! ");
		
		return "/member/MemberInfo";
	}
	
	@RequestMapping(value = "/member/memberCash.do", method = RequestMethod.GET)
	public String memberCash(HttpSession session, Model model) {
		logger.info("Welcome MemberController memberCash! ");
		
		return "/member/MemberCash";
	}

	// 회원수정
//	@RequestMapping(value = "/member/updateCtr.do"
//		, method = RequestMethod.POST)
//	public String memberUpdateCtr(HttpSession session,
//		MemberDto memberDto, Model model) {
//		logger.info("Welcome MemberController memberUpdateCtr {}" 
//		 , memberDto);
//		
//		int resultNum = 0; 
//			
//		try {
//			resultNum = memberService.memberUpdateOne(memberDto);
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
//				newMemberDto.setEmail(memberDto.getEmail());
//				newMemberDto.setName(memberDto.getName());
//				newMemberDto.setGender(memberDto.getGender());
//				newMemberDto.setBirthDate(memberDto.getBirthDate());
//				newMemberDto.setPassword(memberDto.getPassword());
//				
//				session.removeAttribute("_memberDto_");
//				
//				session.setAttribute("_memberDto_", newMemberDto);
//			}
//		}
//		
//		
//		return "/member/memberInfo.do";
//	}
//	
//	
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
