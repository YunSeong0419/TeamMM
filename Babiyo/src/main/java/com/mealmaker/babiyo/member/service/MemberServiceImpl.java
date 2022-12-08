
package com.mealmaker.babiyo.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.inquiry.dao.InquiryDao;
import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.InterestDto;
import com.mealmaker.babiyo.member.model.MemberDto;
import com.mealmaker.babiyo.notice.model.NoticeDto;
import com.mealmaker.babiyo.order.dao.OrderDao;
import com.mealmaker.babiyo.review.dao.ReviewDao;
import com.mealmaker.babiyo.util.Paging;
import com.mealmaker.babiyo.util.SearchOption;

@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger log 
		= LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	public MemberDao memberDao;
	
	@Resource
	private OrderDao orderDao;
	
	@Resource
	private InquiryDao inquiryDao;
	
	@Resource
	private ReviewDao reviewDao;
	

	public MemberDto memberExist(String id, String password) {
		// TODO Auto-generated method stub
		return memberDao.memberExist(id, password);
	}
	
	@Override
	public int idCheck(String id) {
		int cnt = memberDao.idCheck(id);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	
	@Override
	public int emailCheck(String email) {
		int cnt = memberDao.emailCheck(email);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	@Override
	public int phoneCheck(String phone) {
		int cnt = memberDao.phoneCheck(phone);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	@Override
	public int nicknameCheck(String nickname) {
		int cnt = memberDao.nicknameCheck(nickname);
		System.out.println("cnt: " + cnt);
		return cnt;
	}

	@Override
	public void memberInsertOne(MemberDto memberDto){
		// TODO Auto-generated method stub
		
		
		memberDao.memberInsertOne(memberDto);
		
	}
	
	@Override
	public void addInterest(InterestDto interestDto) {
		// TODO Auto-generated method stub
		
		List<InterestDto> list = interestDto.getInterestList();
		
		String memberId = interestDto.getMemberId();
		
		for (InterestDto interest : list) {
			interest.setMemberId(memberId);
			
			memberDao.addInterest(interest);
		}
		
	}
	
	@Override
	public List<Map<String, Object>> categoryCodeList() {
		// TODO Auto-generated method stub
		return memberDao.categoryCodeList();
	}

	@Override
	public MemberDto memberInfo(MemberDto memberDto) {
		// TODO Auto-generated method stub
		
		return memberDao.memberInfo(memberDto);
	}

	@Override
	public void memberUpdateOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberDao.memberUpdateOne(memberDto);
	}

	@Override
	public void UpdateInterest(InterestDto interestDto) {
		// TODO Auto-generated method stub
		memberDao.UpdateInterest(interestDto);
	}

	@Override
	public List<Map<String, Object>> memberInterest(InterestDto interestDto) {
		// TODO Auto-generated method stub
		return memberDao.memberInterest(interestDto);
	}

	@Override
	public List<Map<String, Object>> selectInterest(String memberId) {
		// TODO Auto-generated method stub
		return memberDao.selectInterest(memberId);
	}

	@Override
	public void memberDeleteOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		memberDao.memberDeleteOne(memberDto);
	}

	@Override
	public MemberDto findId(String email) {
		// TODO Auto-generated method stub
		return memberDao.findId(email);
	}
	
	@Override
	public MemberDto findPwd(String email) {
		// TODO Auto-generated method stub
		return memberDao.findPwd(email);
	}

	@Override
	public void newPwd(MemberDto memberDto) {
		// TODO Auto-generated method stub
		System.out.println(memberDto);
		memberDao.newPwd(memberDto);
	}

	@Override
	public Map<String, Integer> memberListCount(String id) {
		// TODO Auto-generated method stub
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int orderCount = orderDao.memberOrderCount(id);
		int inquiryCount = inquiryDao.memberInquiryCount(id);
		int reviewCount = reviewDao.memberReviewCount(id);
		
		map.put("orderCount", orderCount);
		map.put("inquiryCount", inquiryCount);
		map.put("reviewCount", reviewCount);
		
		return map;
	}

	@Override
	public Map<String, Object> memberList(SearchOption searchOption, int curPage) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();

		int totalCount = memberDao.memberCount(searchOption);

		Paging paging = new Paging(totalCount, curPage);

		int begin = paging.getPageBegin();
		int end = paging.getPageEnd();

		List<MemberDto> memberList = memberDao.memberList(begin, end, searchOption, curPage);

		map.put("paging", paging);
		map.put("memberList", memberList);

		return map;
	}

	

}
