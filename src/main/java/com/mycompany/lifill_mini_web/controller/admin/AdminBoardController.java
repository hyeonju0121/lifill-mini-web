package com.mycompany.lifill_mini_web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.lifill_mini_web.dto.Board;
import com.mycompany.lifill_mini_web.dto.Pager;
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
	public String noticeList(String pageNo, Model model, HttpSession session) {
		log.info("noticeList() 실행");
		
		/*
		 * 게시글 상세보기에서 목록을 누르면 첫번째 페이지로 이동 -> session에서 페이지 넘버 가져오기
		 * pageNo를 받지 못했을 경우, 저장되어있는지 확인
		 */
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if (pageNo == null) {
				// 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
				pageNo = "1";
			}
		}
		// 세션에 pageNo 저장
		session.setAttribute("pageNo", pageNo);
		// 문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		// 페이징 대상이 되는 전체 행의 수 구하기
		// 만약에, 검색어를 이용해서 전체 행의 수를 구한다면 searchRows 라는 서비스 메소드를 만들어서 진행하기
		int rows = adminBoardService.getTotalRows();
		
		// adminBoardService 에서 게시물 목록 요청
		Pager pager = new Pager(10, 10, rows, intPageNo);
		List<Board> noticeList = adminBoardService.getBoardList(pager);

		// jsp 에서 사용할 수 있도록 설정
		model.addAttribute("pager", pager);
		model.addAttribute("noticeList", noticeList);
		
		return "admin/board/noticeList";
	}

	@GetMapping("/board/writeNoticeForm")
	public String writeNoticeForm() {
		log.info("writeNoticeForm() 실행");
		return "admin/board/writeNoticeForm";
	}

	@PostMapping("/board/writeNotice")
	public String writeNotice(Board board) {
		log.info("writeNotice 실행");

		// 요청 데이터의 유효성 검사
		// 파일 원래 이름과 type 로그 출력 --------------------------
		/*log.info("original filename: " + board.getBattach().getOriginalFilename());
		log.info("filetype: " + board.getBattach().getContentType());*/

		// (첨부 파일이 있는지 여부 조사)첨부파일이 넘어오지 않을 경우 상황도 생각해줘야 함
		// 첨부파일이 존재하는 경우
		if (board.getBattach() != null && !board.getBattach().isEmpty()) {
			// DTO 추가 설정
			board.setBattachoname(board.getBattach().getOriginalFilename());
			board.setBattachtype(board.getBattach().getContentType());
			
			try {
				// 비즈니스 로직 측에서 발생하는 예외는 없기 때문에, try-catch로 예외처리 함
				log.info("board.attachdata: ", board.getBattach().getBytes());
				board.setBattachdata(board.getBattach().getBytes());
			} catch (Exception e) {
			}
		}

		// 로그인된 사용자 아이디 설정
		board.setMid("hyeonju0121");

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
