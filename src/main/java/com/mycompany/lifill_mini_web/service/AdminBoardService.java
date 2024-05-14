package com.mycompany.lifill_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.lifill_mini_web.dao.BoardDao;
import com.mycompany.lifill_mini_web.dto.Board;
import com.mycompany.lifill_mini_web.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminBoardService {
	@Resource
	private BoardDao boardDao;

	// 공지사항 작성
	@Transactional
	public void writeNotice(Board board) {
		board.setBtype("notice");
		board.setBsubcategory(board.getBsubcategory());

		log.info("board: " + board);
		int rowNum = boardDao.bInsert(board);
		log.info("rowNum: " + rowNum + ", bno: " + board.getBno());
	}

	public List<Board> getBoardList(Pager pager) {
		List<Board> board = boardDao.bAdminSelectByPageForNotice(pager);
		
		return board;
	}

	public int getTotalRows() {
		return boardDao.bCount();
	}

	// 게시물 상세조회 
	public Board getBoard(int bno) {
		Board board = boardDao.bSelectByBno(bno);
		
		 board = boardBtypeValidation(board);
		
		return board;
	}
	
	/*
	 * board btype 타입 변환 메소드 
	 */
	public Board boardBtypeValidation(Board board) {
		String bSubCategoryTemp = board.getBsubcategory();
		
		switch(bSubCategoryTemp) {
			case "general": board.setBsubcategory("일반"); break;
			case "product": board.setBsubcategory("상품"); break;
			case "delivery": board.setBsubcategory("배송"); break;
			default: 
				throw new RuntimeException("공지사항 타입 설정이 잘못 되었습니다.");
		}
		return board;
	}

	public byte[] getAttachData(int bno) {
		Board board = boardDao.bSelectByAttachData(bno);
		return board.getBattachdata();
	}

	public void updateBoard(Board board) {
		boardDao.bUpdate(board);
	}

	public void removeBoard(int bno) {
		boardDao.bDeleteByBno(bno);
	}

}
