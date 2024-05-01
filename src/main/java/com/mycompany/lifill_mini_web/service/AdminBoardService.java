package com.mycompany.lifill_mini_web.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.lifill_mini_web.dao.BoardDao;
import com.mycompany.lifill_mini_web.dto.Board;

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
		log.info("rowNum: " + rowNum + ", bno: " + board.getBNo());
	}
	

}
