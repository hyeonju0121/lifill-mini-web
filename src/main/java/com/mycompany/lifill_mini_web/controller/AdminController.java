package com.mycompany.lifill_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")
@Slf4j
@Controller
public class AdminController {
	
	@RequestMapping("")
	public String index() {
		log.info("index() 실행");
		return "admin/index";
	}

	@RequestMapping("/read_order")
	public String readOrder() {
		log.info("readOrder() 실행");
		return "admin/read_order";
	}
	
	@RequestMapping("/change_order")
	public String changeOrder() {
		log.info("changeOrder() 실행");
		return "admin/change_order";
	}
	
	@RequestMapping("/delete_order")
	public String deleteOrder() {
		log.info("deleteOrder() 실행");
		return "admin/delete_order";
	}
	
	@RequestMapping("/create_item")
	public String createItem() {
		log.info("createItem() 실행");
		return "admin/create_item";
	}
	
	@RequestMapping("/read_item")
	public String readItem() {
		log.info("readItem() 실행");
		return "admin/read_item";
	}
	
	@RequestMapping("/update_item")
	public String updateItem() {
		log.info("updateItem() 실행");
		return "admin/update_item";
	}
	
	@RequestMapping("/delete_item")
	public String deleteItem() {
		log.info("deleteItem() 실행");
		return "admin/delete_item";
	}
}
