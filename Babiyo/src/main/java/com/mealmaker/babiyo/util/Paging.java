package com.mealmaker.babiyo.util;

import java.io.Serializable;


public class Paging implements Serializable {

	// 페이지당 게시물 수
	public static final int PAGE_SCALE = 10;

	// 블럭당 페이지수
	public static final int BLOCK_SCALE = 10;

	private int curPage; // 현재 페이지 위치
	
	private int totCount; // 전체 게시글 수
	private int totPage; // 전체 페이지 갯수
	private int totBlock; // 전체 페이지 블록 갯수
	private int curBlock; // 현재 페이지 블록

	private int prevBlock; // 이전 페이지 블록 
	private int nextBlock; // 다음 페이지 블록

	private int pageBegin; // #{start}
	private int pageEnd; // #{end}

	private int blockBegin; // [이전]
	private int blockEnd; // [다음]

//	Paging(레코드 갯수, 현재 페이지 번호)
	public Paging(int totalCount, int curPage) {
		curBlock = 1;
		this.curPage = curPage;

		
		setTotCount(totalCount);
		setPageRange();
		setTotBlock();
		setBlockRange();
	}

	public void setBlockRange() {
		curBlock = (curPage - 1) / BLOCK_SCALE + 1;
		blockBegin = (curBlock - 1) * BLOCK_SCALE + 1;
		
		blockEnd = blockBegin + BLOCK_SCALE - 1;
		
		if(blockEnd > totPage) {
			blockEnd = totPage;
		}
		
		// 이전 버튼 누를시 이동할 페이지 번호
		// 현재 블럭이 1이면 이전블럭을 누르면 페이지 1로 이동
		// 현재 블럭이 1이 아니면  이전블럭의 마지막 페이지로 이동
		prevBlock = (curBlock == 1) ? 1 : (curBlock - 1) * BLOCK_SCALE;
		
		// 다음 버튼 누를시 이동할 페이지번호
		// 현재블럭이 마지막블럭일 경우 현재 블럭의 마지막 페이지로 이동
		// 현재블럭이 마지막 블럭이 아닐 경우 다음블럭의 첫번째 페이지로 이동
		nextBlock = curBlock == totBlock ? curBlock* BLOCK_SCALE
				: (curBlock * BLOCK_SCALE) + 1;
		
		// 다음버튼으로 이동할 페이지가 총페이지보다 클경우 총페이지수로 변경
		// 최대값보다 더 큰값을 못받게 하기위한 조건문
		if(nextBlock > totPage) {
			nextBlock = totPage;
		}
	}

	public void setPageRange() {
		pageBegin = (curPage - 1) * PAGE_SCALE + 1;
		
		pageEnd = pageBegin + PAGE_SCALE - 1;
	}

	
	
	public int getTotCount() {
		return totCount;
	}

	public void setTotCount(int totCount) {
		this.totCount = totCount;
		this.totPage = (totCount-1) / PAGE_SCALE + 1;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock() {
		totBlock = (totPage-1) / BLOCK_SCALE + 1;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
	
	
	
}
