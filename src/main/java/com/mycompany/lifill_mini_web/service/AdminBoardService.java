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
			System.out.println("typeTemp: " + typeTemp);
			
			switch(typeTemp) {
				case "general" : temp.setBtype("일반"); break;
				case "product" : temp.setBtype("상품"); break;
				case "delivery": temp.setBtype("배송"); break;
				default: 
					throw new RuntimeException("공지사항 타입 설정이 잘못 되었습니다.");
			}
		}
		
		return board;
	}

	public int getTotalRows() {
		return boardDao.count();
	}

}
