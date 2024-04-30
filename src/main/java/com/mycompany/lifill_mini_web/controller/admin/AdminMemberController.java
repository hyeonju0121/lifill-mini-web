package com.mycompany.lifill_mini_web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("admin/member")
@Slf4j
@Controller
public class AdminMemberController {
	@RequestMapping("/memberList")
	public String memberList() {
		log.info("memberList() 실행");
		return "admin/member/memberList";
	}
	
	@RequestMapping("/memberUpdate")
	public String memberUpdate() {
		log.info("memberUpdate() 실행");
		return "admin/member/memberUpdate";
	}

}
