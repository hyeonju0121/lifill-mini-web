package com.mycompany.lifill_mini_web.controller.admin;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
		 * 게시글 상세보기에서 목록을 누르면 첫번째 페이지로 이동 -> session에서 페이지 넘버 가져오기 pageNo를 받지 못했을 경우,
		 * 저장되어있는지 확인
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

		// Pager 객체 생성
		int rowsPagingTarget = adminBoardService.getTotalRowsNotice();
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);

		List<Board> noticeList = adminBoardService.getBoardList(pager);

		// jsp 에서 사용할 수 있도록 설정
		model.addAttribute("pager", pager);
		model.addAttribute("noticeList", noticeList);

		return "admin/board/noticeList";
	}

	@GetMapping("/board/detailNotice")
	public String detailNotice(int bno, Model model) {
		Board board = adminBoardService.getBoard(bno);

		model.addAttribute("board", board);

		return "admin/board/detailNotice";
	}

	@GetMapping("/board/attachDownload")
	public void attachDownload(int bno, HttpServletResponse response) throws Exception {
		// 다운로드할 데이터를 준비
		Board board = adminBoardService.getBoard(bno);
		byte[] data = adminBoardService.getAttachData(bno);

		// 응답 헤더 구성
		response.setContentType(board.getBattachtype());
		// 한글 파일의 이름 -> 인코딩 변경
		String fileName = new String(board.getBattachoname().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.write(data);
		os.flush();
		os.close();
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
		/*
		 * log.info("original filename: " + board.getBattach().getOriginalFilename());
		 * log.info("filetype: " + board.getBattach().getContentType());
		 */

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

	@GetMapping("/board/updateNoticeForm")
	public String updateNoticeForm(int bno, Model model) {
		Board board = adminBoardService.getBoard(bno);

		model.addAttribute("board", board);

		return "admin/board/updateNoticeForm";
	}

	@PostMapping("/board/updateNotice")
	public String updateNotice(Board board) {
		log.info("실행");
		// (첨부 파일이 있는지 여부 조사)첨부파일이 넘어오지 않을 경우 상황도 생각해줘야 함
		// 첨부파일이 존재하는 경우
		if (board.getBattach() != null && !board.getBattach().isEmpty()) {
			// DTO 추가 설정
			board.setBattachoname(board.getBattach().getOriginalFilename());
			board.setBattachtype(board.getBattach().getContentType());
			try {
				// 비즈니스 로직 측에서 발생하는 예외는 없기 때문에, try-catch로 예외처리 함
				board.setBattachdata(board.getBattach().getBytes());
			} catch (Exception e) {
			}
		}

		// 비즈니스 로직 처리를 서비스로 위임
		adminBoardService.updateBoard(board);

		return "redirect:/admin/board/detailNotice?bno=" + board.getBno();
	}

	@GetMapping("/board/deleteNotice")
	public String deleteBoard(int bno) {
		adminBoardService.removeBoard(bno);
		return "redirect:/admin/board/noticeList";
	}

	// 자주묻는질문 -------------------------------------------
	@RequestMapping("/board/faqList")
	public String faqList(String pageNo, Model model, HttpSession session) {
		log.info("faqList() 실행");

		/*
		 * 게시글 상세보기에서 목록을 누르면 첫번째 페이지로 이동 -> session에서 페이지 넘버 가져오기 pageNo를 받지 못했을 경우,
		 * 저장되어있는지 확인
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

		// Pager 객체 생성
		int rowsPagingTarget = adminBoardService.getTotalRowsFaq();
		Pager pager = new Pager(5, 5, rowsPagingTarget, intPageNo);

		List<Board> faqList = adminBoardService.getFaqList(pager);

		// jsp 에서 사용할 수 있도록 설정
		model.addAttribute("pager", pager);
		model.addAttribute("faqList", faqList);

		return "admin/board/faqList";
	}

	@RequestMapping("/board/writeFaqForm")
	public String writeFaqForm() {
		log.info("writeFaqForm() 실행");
		return "admin/board/writeFaqForm";
	}

	@PostMapping("/board/writeFaq")
	public String writeFaq(Board board) {
		log.info("writeFaq() 실행");

		// 요청 데이터의 유효성 검사
		// 파일 원래 이름과 type 로그 출력 --------------------------
		/*
		 * log.info("original filename: " + board.getBattach().getOriginalFilename());
		 * log.info("filetype: " + board.getBattach().getContentType());
		 */

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
		adminBoardService.writeFaq(board);
		return "redirect:/admin/board/faqList";
	}

	@GetMapping("/board/updateFaqForm")
	public String updateFaqForm(int bno, Model model) {
		Board board = adminBoardService.getBoard(bno);

		model.addAttribute("board", board);

		return "admin/board/updateFaqForm";
	}

	@PostMapping("/board/updateFaq")
	public String updateFaq(Board board) {
		log.info("실행");
		// (첨부 파일이 있는지 여부 조사)첨부파일이 넘어오지 않을 경우 상황도 생각해줘야 함
		// 첨부파일이 존재하는 경우
		if (board.getBattach() != null && !board.getBattach().isEmpty()) {
			// DTO 추가 설정
			board.setBattachoname(board.getBattach().getOriginalFilename());
			board.setBattachtype(board.getBattach().getContentType());
			try {
				// 비즈니스 로직 측에서 발생하는 예외는 없기 때문에, try-catch로 예외처리 함
				board.setBattachdata(board.getBattach().getBytes());
			} catch (Exception e) {
			}
		}

		// 비즈니스 로직 처리를 서비스로 위임
		adminBoardService.updateBoard(board);

		return "redirect:/admin/board/detailFaq?bno=" + board.getBno();
	}
	
	@GetMapping("/board/deleteFaq")
	public String deleteFaq(int bno) {
		adminBoardService.removeBoard(bno);
		return "redirect:/admin/board/faqList";
	}
	
	// 1:1 문의 -------------------------------------------
	@RequestMapping("/board/inquiryList")
	public String inquiryList() {
		log.info("inquiryList() 실행");
		return "admin/board/inquiryList";
	}

}
