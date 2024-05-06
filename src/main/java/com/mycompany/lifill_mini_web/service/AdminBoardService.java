package com.mycompany.lifill_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
	public void writeNotice(Board board) {

		log.info("board: " + board);
		int rowNum = boardDao.insert(board);
		log.info("rowNum: " + rowNum + ", bno: " + board.getBno());
	}

	public List<Board> getBoardList(Pager pager) {
		List<Board> board = boardDao.selectByPage(pager);
		
		for (Board temp: board) {
			String typeTemp = temp.getBtype();
			temp = boardBtypeValidation(temp);
		}
		return board;
	}

	public int getTotalRows() {
		return boardDao.count();
	}

	// 게시물 상세조회 
	public Board getBoard(int bno) {
		Board board = boardDao.selectByBno(bno);
		
		 board = boardBtypeValidation(board);
		
		return board;
	}
	
	/*
	 * board btype 타입 변환 메소드 
	 */
	public Board boardBtypeValidation(Board board) {
		String btypeTemp = board.getBtype();
		
		switch(btypeTemp) {
			case "general": board.setBtype("일반"); return board;
			case "product": board.setBtype("상품"); return board;
			case "delivery": board.setBtype("배송"); return board;
			default: 
				throw new RuntimeException("공지사항 타입 설정이 잘못 되었습니다.");
		}
	}

	public byte[] getAttachData(int bno) {
		Board board = boardDao.selectAttachData(bno);
		return board.getBattachdata();
	}

}
