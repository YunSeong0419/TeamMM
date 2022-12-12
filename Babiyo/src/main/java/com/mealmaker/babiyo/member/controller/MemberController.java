package com.mealmaker.babiyo.member.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mealmaker.babiyo.member.model.InterestDto;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.member.service.MemberService;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

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
	//로그인
	@RequestMapping(value = "/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String id, String password
			, HttpSession session, Model model) {
		logger.info("Welcome MemberController loginCtr! " + id 
			+ ", " + password);
		
		MemberDto memberDto = memberService.memberExist(id, password);
		logger.info("wel" + id + "," + password);
		logger.info("wel" + memberDto);
		String viewUrl = "";
		if(memberDto != null) {
			session.setAttribute("_memberDto_", memberDto);
			logger.info("Welcome" + memberDto);
			viewUrl = "redirect:/main.do";
		}else{
			
			viewUrl = "/auth/LoginFail";
		}
		
		return viewUrl;
	}
	
	@RequestMapping(value = "/auth/findId.do", method = RequestMethod.GET)
	public String findId(HttpSession session, Model model) {
		logger.info("Welcome MemberController findId! ");
		
		
		return "/auth/MemberFindId";
	}
	//아이디 찾기
	@RequestMapping(value = "/auth/findIdCtr.do", method = RequestMethod.POST)
	public String findId(String email, HttpSession session, Model model) {
		logger.info("Welcome  findIdCtr! " + email);
		
		MemberDto memberDto = memberService.findId(email);
		logger.info("wel" + email);
		
		model.addAttribute("memberId", memberDto.getId());
		
		return "auth/CompleteFindId";
	}
	
	@RequestMapping(value = "/auth/findPwd.do", method = RequestMethod.GET)
	public String findPwd(HttpSession session, Model model) {
		logger.info("Welcome MemberController findPwd! ");
		
		return "/auth/MemberFindPwd";
	}
	
	@RequestMapping(value = "/auth/findPwdCtr.do", method = RequestMethod.POST)
	public String findPwd(String email
			, HttpSession session, Model model) {
		logger.info("Welcome  findPwdCtr! " + email);
		
		MemberDto memberDto = memberService.findPwd(email);
		logger.info("your mail is " + email);
		System.out.println(memberDto);
		
		model.addAttribute("memberId", memberDto.getId());
			
		return "auth/MemberNewPwd";
	}
	
	@RequestMapping(value = "/auth/newPwdCtr.do", method = RequestMethod.POST)
	public String newPwd(MemberDto memberDto, HttpSession session, Model model) {
		logger.info("Welcome  newPwdCtr! " );
		
		memberService.newPwd(memberDto);
		
		System.out.println(memberDto);
		
		return "redirect:/auth/CompleteNewPwd.do";
	}
	
	@RequestMapping(value = "/auth/CompleteNewPwd.do", method = RequestMethod.GET)
	public String completePwd(HttpSession session, Model model) {
		logger.info("Welcome MemberController complete change password! ");
		
		return "auth/CompleteNewPwd";
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
	
	
	@ResponseBody
	@PostMapping(value="/member/ajax/passwordCheck.do")
	public boolean infoPwdCheck(HttpSession session, @RequestParam String pwd) {
		
		MemberDto memberDto = (MemberDto)session.getAttribute("_memberDto_");
		String memberId = memberDto.getId();
		
		MemberDto memberDtoCheck = memberService.memberExist(memberId, pwd);
		
		boolean pwdCheck =  memberDtoCheck != null;
		
		return pwdCheck;
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
		MemberDto memberDto = (MemberDto)session.getAttribute("_memberDto_");
		System.out.println(memberDto);
		return "/member/CheckOut";
	}
	
	
	// 회원탈퇴
		@RequestMapping(value = "/member/deleteCtr.do", method = RequestMethod.POST)
		public String memberDelete(MemberDto memberDto, Model model, HttpSession session) {
			logger.info("Welcome memberDelete! " + memberDto);
			System.out.println(memberDto);
			memberService.memberDeleteOne(memberDto);
			
			return "redirect:/auth/login.do";
		}
	
	// 회원정보
	@RequestMapping(value = "/member/memberInfo.do", method = RequestMethod.GET)
	public String memberInfo(HttpSession session, Model model, String id) {
		logger.info("Welcome MemberController memberInfo! ");
		
		MemberDto memberDto =
				memberService.memberInfo((MemberDto) session.getAttribute("_memberDto_"));
		id = memberDto.getId();
		
		memberService.memberListCount(id);
		
		Map<String, Integer> countMap = memberService.memberListCount(id);
		model.addAttribute("countMap", countMap);
		session.setAttribute("_memberDto_", memberDto);
		
		return "/member/MemberInfo";
	}
	
	@RequestMapping(value = "/member/memberCash.do", method = RequestMethod.GET)
	public String memberCash(HttpSession session, Model model) {
		logger.info("Welcome MemberController memberCash! ");
		
		return "/member/MemberCash";
	}
	
	@RequestMapping(value = "/admin/member/memberList.do")
	public String adminMemberList(@RequestParam(defaultValue = "1") int curPage
			, SearchOption searchOption
			, HttpSession session, Model model) {
		logger.info("Welcome NoticeController Memberlist! ");
		
		Map<String, Object> map = memberService.memberList(searchOption, curPage);
		
		// 리스트
		@SuppressWarnings("unchecked")
		List<MemberDto> memberList = (List<MemberDto>) map.get("memberList");
		Paging paging = (Paging) map.get("paging");
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("paging", paging);
		model.addAttribute("searchOption", searchOption);

		return "/admin/member/memberList";
	}


}
