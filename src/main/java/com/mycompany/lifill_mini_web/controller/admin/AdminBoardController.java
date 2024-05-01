package com.mycompany.lifill_mini_web.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.lifill_mini_web.dto.Board;
import com.mycompany.lifill_mini_web.service.AdminBoardService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	// 공지사항 -------------------------------------------
	@RequestMapping("/board/noticeList")
	public String noticeList() {
		log.info("noticeList() 실행");
		return "admin/board/noticeList";
	}
	
	@GetMapping("/board/writeNoticeForm")
	public String writeNoticeForm() {
		log.info("writeNoticeForm() 실행");
		return "admin/board/writeNoticeForm";
	}
	
	@PostMapping("/board/writeNotice")
	public String writeNotice(Board board) {
		
		board.setBTitle("ZZZZZ");
		board.setBContent("dd");
		board.setBType("상품");
		
		// 로그인된 사용자 아이디 설정
		board.setMId("1");
		
		// 비즈니스 로직 처리를 서비스로 위임
		adminBoardService.writeNotice(board);
		
		return "redirect:/admin/board/noticeList";
	}

	
	// 자주묻는질문 -------------------------------------------
	@RequestMapping("/board/faqList")
	public String faqList() {
		log.info("faqList() 실행");
		return "admin/board/faqList";
	}
	
	@RequestMapping("/board/writeFaq")
	public String writeFaq() {
		log.info("writeFaq() 실행");
		return "admin/board/writeFaq";
	}
	
	
	// 1:1 문의 -------------------------------------------
	@RequestMapping("/board/inquiryList")
	public String inquiryList() {
		log.info("inquiryList() 실행");
		return "admin/board/inquiryList";
	}

}
