package com.mycompany.lifill_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class MainController {
	/**
	 * @return 임시 메인페이지 
	 */
	@RequestMapping("")
	public String home() {
		return "main/main";
	}

}
