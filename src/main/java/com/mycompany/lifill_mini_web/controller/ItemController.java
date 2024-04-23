package com.mycompany.lifill_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/item")
@Slf4j
@Controller
public class ItemController {

	@RequestMapping("")
	public String index() {
		log.info("index() 실행");
		return "item/index";
	}
	
	@RequestMapping("/category1")
	public String category1() {
		log.info("category1() 실행");
		return "item/category1";
	}
	
	@RequestMapping("/category2")
	public String category2() {
		log.info("category2() 실행");
		return "item/category2";
	}
	
	@RequestMapping("/category3")
	public String category3() {
		log.info("category3() 실행");
		return "item/category3";
	}
	
	@RequestMapping("/category4")
	public String category4() {
		log.info("category4() 실행");
		return "item/category4";
	}
	
	@RequestMapping("/category5")
	public String category5() {
		log.info("category5() 실행");
		return "item/category5";
	}
	
	@RequestMapping("/category6")
	public String category6() {
		log.info("category6() 실행");
		return "item/category6";
	}
	
	@RequestMapping("/item_view")
	public String itemView() {
		log.info("itemView() 실행");
		return "item/item_view";
	}
	
	@RequestMapping("/order")
	public String order() {
		log.info("order() 실행");
		return "item/order";
	}
}
