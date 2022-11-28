package com.mealmaker.babiyo.cash.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mealmaker.babiyo.cash.dao.CashDao;
import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.MemberDto;

@Service
public class CashServiceImpl implements CashService{

	private static final Logger log 
		= LoggerFactory.getLogger(CashServiceImpl.class);
	
	@Autowired
	private CashDao cashDao;
		
	@Resource
	private MemberDao memberDao;

	@Override
	public MemberDto cashChargeOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		cashDao.cashChargeOne(memberDto);
		
		
		
		
		
		
		return memberDao.memberInfo(memberDto);
	}
	

	

	

	

}
