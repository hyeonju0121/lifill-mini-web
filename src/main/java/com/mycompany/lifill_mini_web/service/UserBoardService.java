package com.mycompany.lifill_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.BoardDao;
import com.mycompany.lifill_mini_web.dto.Board;
import com.mycompany.lifill_mini_web.dto.Pager;

@Service
public class UserBoardService {
	
	@Resource
	private BoardDao boardDao;
	
	public List<Board> getNoticeList(Pager pager) {
		// 비즈니스 로직 처리 코드...
		List<Board> boardList = boardDao.bSelectByPageForNotice(pager);
		
		return boardList;
	}
	
	public List<Board> getFaqList(Pager pager) {
		// 비즈니스 로직 처리 코드...
		List<Board> boardList = boardDao.bSelectByPageForFaq(pager);
		
		return boardList;
	}
	
	public int getTotalRows() {
		// 비즈니스 로직 처리 코드...
		
		int totalRows = boardDao.bCount();
		return totalRows;
	}
	
	public int getTotalRowsNotice() {
		// 비즈니스 로직 처리 코드...
		
		int totalRows = boardDao.bCountNoticeType();
		return totalRows;
	}
	
	public int getTotalRowsFaq() {
		// 비즈니스 로직 처리 코드...
		
		int totalRows = boardDao.bCountFaqType();
		return totalRows;
	}
	
	public Board getBoard(int bno) {
		
		Board board = boardDao.bSelectByBno(bno);
		return board;
	}

	public byte[] getAttachData(int bno) {
		
		Board board = boardDao.bSelectByAttachData(bno);
		return board.getBattachdata();
	}
	
	/*
	 * board btype 타입 변환 메소드 
	 */
	public Board boardBtypeValidation(Board board) {
		String bSubCategoryTemp = board.getBsubcategory();
		
		switch(bSubCategoryTemp) {
			case "general": board.setBsubcategory("일반"); return board;
			case "product": board.setBsubcategory("상품"); return board;
			case "delivery": board.setBsubcategory("배송"); return board;
			default: 
				throw new RuntimeException("공지사항 타입 설정이 잘못 되었습니다.");
		}
	}

	/*
	 * faq btype 타입 변환 메소드 
	 */
	public Board faqBsubCategoryValidation(Board board) {
		String bSubCategoryTemp = board.getBsubcategory();
		
		switch(bSubCategoryTemp) {
			case "member": board.setBsubcategory("회원정보"); break;
			case "order": board.setBsubcategory("주문/결제"); break;
			case "exchange": board.setBsubcategory("교환/반품"); break;
			case "delivery": board.setBsubcategory("배송"); break;
			default: 
				throw new RuntimeException("자주묻는질문 타입 설정이 잘못 되었습니다.");
		}
		return board;
	}
}
