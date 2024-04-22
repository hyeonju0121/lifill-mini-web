package com.mycompany.lifill_mini_web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("admin/order")
@Slf4j
@Controller
public class AdminOrderController {
	@RequestMapping("/dashboard")
	public String dashboard() {
		log.info("dashboard() 실행");
		return "admin/order/dashboard";
	}

}
