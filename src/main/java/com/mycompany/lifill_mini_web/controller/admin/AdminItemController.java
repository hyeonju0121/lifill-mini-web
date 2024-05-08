package com.mycompany.lifill_mini_web.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.lifill_mini_web.dto.Product;
import com.mycompany.lifill_mini_web.service.AdminItemService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("admin/item")
@Slf4j
@Controller
public class AdminItemController {
	@Autowired
	private AdminItemService adminItemService;
	
	@RequestMapping("/dashboard")
	public String dashboard() {
		log.info("dashboard() 실행");
		return "admin/item/dashboard";
	}

	@RequestMapping("/createItemForm")
	public String createItemForm() {
		log.info("createItemForm() 실행");
		return "admin/item/createItemForm";
	}

	@PostMapping("/createItem")
	public String createItem(Product.createProductRequest request) {
		log.info("실행");
		
		for (MultipartFile fileTemp : request.getPrdimglist()) {
			log.info("fileName={}", fileTemp.getOriginalFilename());
		}
		
		log.info("fileDetailName={}", request.getPrdimgdetailattach().getOriginalFilename());
		
		adminItemService.createItem(request);

		return "redirect:/admin/item/itemList";
	}

	@RequestMapping("/itemList")
	public String itemList() {
		log.info("itemList() 실행");
		return "admin/item/itemList";
	}

	@RequestMapping("/itemUpdate")
	public String itemUpdate() {
		log.info("itemUpdate() 실행");
		return "admin/item/itemUpdate";
	}

}
