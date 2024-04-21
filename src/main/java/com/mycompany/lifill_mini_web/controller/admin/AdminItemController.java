package com.mycompany.lifill_mini_web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("admin/item")
@Slf4j
@Controller
public class AdminItemController {
	@RequestMapping("/dashboard")
	public String dashboard() {
		log.info("dashboard() 실행");
		return "admin/item/dashboard";
	}
	
}