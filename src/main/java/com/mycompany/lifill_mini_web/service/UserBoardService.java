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
		
		List<Board> boardList = boardDao.bselectByPage(pager);
		return boardList;
	}
	
	public int getTotalRows() {
		// 비즈니스 로직 처리 코드...
		
		int totalRows = boardDao.bcount();
		return totalRows;
	}
	
	public Board getBoard(int bno) {
		
		Board board = boardDao.bselectByBno(bno);
		return board;
	}

	public byte[] getAttachData(int bno) {
		
		Board board = boardDao.bselectByAttachData(bno);
		return board.getBattachdata();
	}
}
