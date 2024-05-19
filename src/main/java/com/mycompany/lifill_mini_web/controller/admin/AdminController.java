package com.mycompany.lifill_mini_web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")
@Slf4j
@Controller
public class AdminController {
	/*
	@RequestMapping("")
	public String index() {
		log.info("index() 실행");
		return "admin/index";
	}
	*/
	
	@RequestMapping("/admin_login")
	public String login() {
		return "admin/admin_login";
	}
	
	@RequestMapping("")
	public String main() {
		return "admin/admin_main";
	}

}
