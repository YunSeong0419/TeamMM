package com.mealmaker.babiyo.member.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mealmaker.babiyo.member.dao.MemberDao;
import com.mealmaker.babiyo.member.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger log 
		= LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	public MemberDao memberDao;
	

	public MemberDto memberExist(String id, String password) {
		// TODO Auto-generated method stub
		return memberDao.memberExist(id, password);
	}

	@Override
	public void memberInsertOne(MemberDto memberDto
		, MultipartHttpServletRequest mulRequest) throws Exception{
		// TODO Auto-generated method stub
		
		memberDao.memberInsertOne(memberDto);
		
		
		
		
//		
//
//	@Override
//	public Map<String, Object> memberSelectOne(int no) {
//		// TODO Auto-generated method stub
//		
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		
//		MemberDto memberDto = memberDao.memberSelectOne(no);
//		resultMap.put("memberDto", memberDto);
//		
//		List<Map<String, Object>> fileList = memberDao.fileSelectList(no);
//		resultMap.put("fileList", fileList);
//		
//		return resultMap;
//	}
//
//	@Transactional(rollbackFor = Exception.class)
//	@Override
//	public int memberUpdateOne(MemberDto memberDto
//		, MultipartHttpServletRequest multipartHttpServletRequest,
//			int fileIdx) throws Exception {
//		
//		int resultNum = 0;
//		
//		try {
//			resultNum = memberDao.memberUpdateOne(memberDto);
//			
//			String parentSeq = ((MemberDto) memberDto).getId();
//			Map<String, Object> tempFileMap 
//				= memberDao.fileSelectStoredFileName(parentSeq);
//			
//			List<Map<String, Object>> list 
//				= fileUtils.parseInsertFileInfo(parentSeq
//					, multipartHttpServletRequest);
//			
//			// 일단 하나의 파일만 가능하도록 구현
//			if(list.isEmpty() == false) {
//				if(tempFileMap != null) {
//					memberDao.fileDelete(parentSeq);
//					fileUtils.parseUpdateFileInfo(tempFileMap);
//				}
//				
//				for (Map<String, Object> map : list) {
//					memberDao.insertFile(map);
//				}
//			}else if(fileIdx == -1) {
//				if(tempFileMap != null) {
//					memberDao.fileDelete(parentSeq);
//					fileUtils.parseUpdateFileInfo(tempFileMap);
//				}
//			}
//		}catch (Exception e) {
//			TransactionAspectSupport.currentTransactionStatus()
//				.setRollbackOnly();
//		}
//		
//		return resultNum;
//	}
//
//	@Override
//	public void memberDeleteOne(int no) {
//		// TODO Auto-generated method stub
//		memberDao.memberDeleteOne(no);
//	}
//
//	@Override
//	public int memberSelectTotalCount(String searchOption, String keyword) {
//		// TODO Auto-generated method stub
//		return memberDao.memberSelectTotalCount(searchOption, keyword);
//	}

	}

	@Override
	public List<MemberDto> memberSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> memberSelectOne(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memberUpdateOne(MemberDto memberDto, MultipartHttpServletRequest multipartHttpServletRequest,
			int fileIdx) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void memberDeleteOne(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int memberSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

}
