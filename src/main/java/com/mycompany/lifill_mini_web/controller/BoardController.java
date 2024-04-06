package com.mycompany.lifill_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/board")
@Slf4j
@Controller
public class BoardController {
	
	@RequestMapping("")
	public String index() {
		log.info("index() 실행");
		return "board/index";
	}
	
	@RequestMapping("/qna")
	public String qna() {
		log.info("qna() 실행");
		return "board/qna";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		log.info("faq() 실행");
		return "board/faq";
	}
	
	@RequestMapping("/notice")
	public String notice() {
		log.info("notice() 실행");
		return "board/notice";
	}
}
