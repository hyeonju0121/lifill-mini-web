package com.mycompany.lifill_mini_web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminBoardController {
	
	@RequestMapping("/board/noticeList")
	public String noticeList() {
		log.info("noticeList() 실행");
		return "admin/board/noticeList";
	}
	
	@RequestMapping("/board/writeNotice")
	public String writeNotice() {
		log.info("writeNotice() 실행");
		return "admin/board/writeNotice";
	}

}
