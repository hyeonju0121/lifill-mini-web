package com.mycompany.lifill_mini_web.controller;

import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.lifill_mini_web.dto.Board;
import com.mycompany.lifill_mini_web.dto.Pager;
import com.mycompany.lifill_mini_web.service.UserBoardService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	
	@Resource
	private UserBoardService service;
	
	@RequestMapping("")
	public String index() {
		log.info("index() 실행");
		return "board/index";
	}
	
	@RequestMapping("/faq")
	public String faq(String pageNo, Model model, HttpSession session) {
		
		log.info("실행");
		
		// pageNo를 받지 못 했을 경우, 세션에 저장되어 있는지 확인
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			// 세션에도 저장되어 있지 않으면 기본값을 1로 세팅
			if (pageNo == null) {
				pageNo = "1";
			}
		}
		
		// 세션에 pageNo 저장
		session.setAttribute("pageNo", pageNo);

		// 문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		// Pager 객체 생성
		int rowsPagingTarget = service.getTotalRowsFaq();
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		
		// Service에서 게시물 목록 요청
		List<Board> faqList = service.getFaqList(pager);
		
		// JSP에서 이용할 수 있도록 설정
		model.addAttribute("pager", pager);
		model.addAttribute("faqList", faqList);

		return "board/faq";
	}
	
	@RequestMapping("/notice")
	public String notice(String pageNo, Model model, HttpSession session) {
		
		log.info("실행");
		
		// pageNo를 받지 못 했을 경우, 세션에 저장되어 있는지 확인
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			// 세션에도 저장되어 있지 않으면 기본값을 1로 세팅
			if (pageNo == null) {
				pageNo = "1";
			}
		}
		
		// 세션에 pageNo 저장
		session.setAttribute("pageNo", pageNo);

		// 문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		// Pager 객체 생성
		int rowsPagingTarget = service.getTotalRowsNotice();
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);
		
		// Service에서 게시물 목록 요청
		List<Board> noticeList = service.getNoticeList(pager);
		
		// JSP에서 이용할 수 있도록 설정
		model.addAttribute("pager", pager);
		model.addAttribute("noticeList", noticeList);

		return "board/notice";
	}
	
	@GetMapping("/attachDownload")
	public void attachDownload(int bno, HttpServletResponse response) throws Exception {
		// 다운로드할 데이터를 준비
		Board board = service.getBoard(bno);
		
		byte[] data = service.getAttachData(bno);
		
		// 응답 헤더 구성
		response.setContentType(board.getBattachtype());
		String filename = new String(board.getBattachoname().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		
		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}
}
